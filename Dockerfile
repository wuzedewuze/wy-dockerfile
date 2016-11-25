# VERSION 0.0.1
# 默认使用centos
FROM centos
# 签名啦
MAINTAINER 2936877795@qq.com

# 增加epel源
RUN yum install -y epel-release
RUN yum install -y openssh-server
RUN mkdir -p /var/run/sshd

# 设置root ssh远程登录密码为123456
RUN echo "root:123456" | chpasswd 

# 安装一个git客户端
RUN yum install -y git expect
# 下载git上的文件
RUN cd /home && git clone https://github.com/wuzedewuze/wy-dockerfile.git
RUN expect /home/wy-dockerfile/ssh-server-expect.sh

# 安装一些必要的工具软件
RUN  yum install -y vim wget curl lrzsz

# 设置中文支持
RUN yum install -y  kde-l10n-Chinese
RUN yum reinstall -y  glibc-common
RUN echo 'export LANG="zh_CN.UTF-8"'  >>/etc/profile

# 安装python环境
RUN yum install -y python
RUN yum install -y python-pip
RUN pip install --upgrade -i https://pypi.douban.com/simple
RUN pip install virtualenv  -i https://pypi.douban.com/simple

# 容器需要开放SSH 22端口
EXPOSE  22

# 初始化启动ssh
ENTRYPOINT /usr/sbin/sshd -D
