FROM darkmatterstudio/blade-builder:0.0.1

ADD ./slc6-devtoolset.repo /etc/yum.repos.d/slc6-devtoolset.repo
RUN yum makecache -y
RUN yum update -y
RUN yum install -y devtoolset-2
RUN yum update -y
