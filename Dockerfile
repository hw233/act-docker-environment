FROM centos:7
RUN yum update -y && yum install -y epel-release make gcc gcc-c++ libffi-devel python-devel openssl-devel python-setuptools && yum install -y python-pip mysql-devel supervisor iproute unzip && pip install --upgrade pip && pip install MySQL-python==1.2.5 && pip install twisted==13.2.0 && pip install autobahn[twisted] && pip install requests && pip install pyzmq txZMQ 
ADD https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz 
RUN tar -zxvf protobuf-2.5.0.tar.gz
RUN rm -rf protobuf-2.5.0.tar.gz
RUN cd protobuf-2.5.0 && ./configure --prefix=/usr/local/protobuf && make && make check && make install && ldconfig && cd python && python setup.py build && python setup.py install && echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/protobuf/lib/;export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/protobuf/lib/;export PATH=$PATH:/usr/local/protobuf/bin/;export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/protobuf/include/;export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/protobuf/include/;export PKG_CONFIG_PATH=/usr/local/protobuf/lib/pkgconfig/" >> /etc/profile && rm -rf /protobuf-2.5.0

