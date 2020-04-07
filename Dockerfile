FROM centos:6

ADD ./Centos-6.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum makecache -y
RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-7
RUN yum install -y nasm
RUN yum install -y ccache
RUN yum install -y scons
RUN yum install -y cmake
RUN yum install -y flex
RUN yum install -y bison
RUN yum install -y gtk2-devel
RUN yum install -y git
RUN yum install -y vim-common
RUN yum install -y python-devel
RUN yum install -y numactl-devel
RUN yum install -y krb5-devel
RUN yum install -y bash-completion
RUN yum install -y htop
RUN yum install -y iftop
RUN yum install -y iotop
RUN yum install -y libpcap-devel
RUN yum install -y redhat-lsb-core
RUN yum install -y sudo
RUN yum install -y emacs
RUN yum install -y wget
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
RUN yum makecache -y
RUN yum update -y
ADD ./ninja-1.8.2.tar.gz /tmp/
ADD ./build_ninja.sh /tmp/
RUN /tmp/build_ninja.sh
RUN sudo rpm --import http://ftp.scientificlinux.org/linux/scientific/6.0/x86_64/os/RPM-GPG-KEY-sl
RUN sudo rpm --import http://ftp.scientificlinux.org/linux/scientific/6.0/x86_64/os/RPM-GPG-KEY-sl6
RUN sudo rpm --import http://ftp.riken.jp/Linux/cern/slc6X/x86_64/RPM-GPG-KEY-cern
ADD ./slc6-devtoolset.repo /etc/yum.repos.d/slc6-devtoolset.repo
RUN yum makecache -y
RUN yum update -y
RUN yum install -y centos-release-scl-rh
RUN yum install -y devtoolset-2-toolchain
RUN yum install -y devtoolset-3
RUN yum install -y devtoolset-4
RUN yum install -y devtoolset-5
RUN yum install -y devtoolset-6
RUN yum update -y
