ARG CUDA_VERSION=10.2
FROM nvidia/cudagl:$CUDA_VERSION-devel-ubuntu18.04
LABEL maintainer "yuma.hiramatsu <yuma.hiramatsu@gmail.com>"

RUN apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE \
   || apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN apt-get update && apt-get install -y --no-install-recommends \
   software-properties-common \
   && add-apt-repository "deb http://librealsense.intel.com/Debian/apt-repo bionic main" -u \
   && apt-get update && apt-get install -y --no-install-recommends \
   cmake \
   freeglut3-dev \
   git \
   libeigen3-dev \
   libjpeg-dev \
   libgl1-mesa-dev \
   libglew-dev \
   librealsense2-dev \
   librealsense2-dkms \
   librealsense2-utils \
   libsuitesparse-dev \
   libudev-dev \
   libusb-1.0-0-dev \
   libxkbcommon-x11-dev \
   openjdk-8-jdk \
   zlib1g-dev \
   && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/stevenlovegrove/Pangolin.git \
   && cd Pangolin \
   && mkdir build && cd build \
   && cmake .. -DAVFORMAT_INCLUDE_DIR="" \
   && cmake --build .

RUN git clone https://github.com/occipital/OpenNI2.git \
   && cd OpenNI2 \
   && make -j8

RUN ln -sf /usr/include/eigen3/Eigen /usr/include/Eigen \
   && ln -sf /usr/include/eigen3/unsupported /usr/include/unsupported

RUN git clone https://github.com/Daichou/ElasticFusion.git \
   && cd ElasticFusion/Core \
   && sed -i "s/set(CUDA_ARCH_BIN/# set(CUDA_ARCH_BIN/" src/CMakeLists.txt \
   && mkdir build && cd build \
   && cmake ../src \
   && make -j8 \
   && cd ../../GUI \
   && mkdir build && cd build \
   && cmake -DWITH_REALSENSE=ON ../src \
   && make -j8

ENV PATH $PATH:/opt/ElasticFusion/GUI/build/

WORKDIR /workspace
