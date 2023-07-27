#!/bin/bash
#you need to image the repo dir into container
REPO_PATH=/home/khalil/workspace/tartancalib
FOLDER=/media/khalil/ssd_data/data_set
IMAGE=omnitartancalib:latest
xhost +
docker run -it --rm -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$REPO_PATH:/catkin_ws/src/kalibr" \
    -v "$FOLDER:/data" ${IMAGE} /bin/bash