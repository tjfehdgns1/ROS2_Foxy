FROM osrf/ros:foxy-desktop


RUN apt-get update 
RUN apt-get install -y \
    build-essential \
    cmake \
    git \
    libbullet-dev \
    python3-colcon-common-extensions \
    python3-flake8 \
    python3-pip \
    python3-pytest-cov \
    python3-rosdep \
    python3-setuptools \
    python3-vcstool \
    wget \
    tmux \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install -U \
    argcomplete \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-deprecated \
    flake8-docstrings \
    flake8-import-order \
    flake8-quotes \
    pytest-repeat \
    pytest-rerunfailures \
    pytest

RUN apt-get install --no-install-recommends -y \
    libasio-dev \
    libtinyxml2-dev \
    libcunit-dev


RUN mkdir -p ~/robot_ws/src && \
    cd ~/robot_ws/src && 
RUN git clone https://github.com/tjfehdgns1/ROS2_Foxy.git && \
    cd ~/robot_ws

RUN colcon build --symlink-install


RUN source /opt/ros/foxy/setup.bash 

RUN echo "Docking Completed"