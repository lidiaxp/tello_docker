xhost local:root
xhost local:docker
xhost +
docker run -it --rm --privileged --name tello_melodic \
    -e DISPLAY=${DISPLAY} \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --network host \
    tello_melodic