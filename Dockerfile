# A bleeding edge Ubuntu 14.04 image for compiling C++11 OpenGL projects.
FROM        ubuntu:14.04

# update and install dependencies
RUN         apt-get update \
                && apt-get install -y \
                    software-properties-common \
                    wget \
                && echo 'deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main' >> /etc/apt/sources.list \
                && wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add - \
                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
                && apt-get update \
                && apt-get install -y \
                    make \
                && apt-get install -y \
                    xorg-dev \
                    libglu1-mesa-dev \ 
                    libglu1-mesa-dev \ 
                    freeglut3-dev \ 
                    mesa-common-dev \
                && apt-get install -y \
                    gcc-4.9 g++-4.9 gcc-4.9-base
           
RUN mkdir /app
WORKDIR /app
COPY . /app