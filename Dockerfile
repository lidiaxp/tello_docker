# Use a imagem base do ROS melodic
FROM ros:melodic-ros-base

# Instale as dependências necessárias para o pacote tello-driver
RUN apt-get update && apt-get install -y \
    ros-melodic-tello-driver \
    && rm -rf /var/lib/apt/lists/

# Crie um diretório de trabalho
WORKDIR /catkin_ws/src

# Clone o repositório tello-driver
RUN apt update
RUN git clone --recursive https://github.com/appie-17/tello_driver.git
RUN git clone https://github.com/ros-perception/camera_info_manager_py
RUN apt install -y ros-melodic-codec-image-transport
RUN apt install -y ros-melodic-camera-info-manager*
RUN apt install -y tmux git

# Navegue para o diretório catkin_ws e compile o pacote
WORKDIR /catkin_ws
# RUN catkin_make

# Defina a variável de ambiente ROS_PACKAGE_PATH
ENV ROS_PACKAGE_PATH=/catkin_ws/src:$ROS_PACKAGE_PATH

# Defina o comando de inicialização para o roslaunch
# roslaunch tello_driver tello_node.launch local_vid_server_port:=11111
# CMD ["roslaunch", "tello_driver", "tello_node.launch"]
