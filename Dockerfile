FROM osrf/ros:foxy-desktop


RUN apt-get update 
RUN apt-get install -y git && \
    apt-get install -y python3-pip && \
    apt-get install -y tmux

RUN mkdir -p ~/robot_ws/src && \
    cd ~/robot_ws/src && 
RUN git clone https://github.com/tjfehdgns1/ROS2.git && \
    cd ~/robot_ws

RUN echo "Docking Completed"