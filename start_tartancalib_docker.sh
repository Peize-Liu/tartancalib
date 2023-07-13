#!/bin/bash
REPO_PATH=/home/khalil/workspace/tartancalib
FOLDER=/media/khalil/ssd_data/data_set
xhost +
docker run -it --rm -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$REPO_PATH:/tartancalib_ws/src/tartancalib" \
    -v "$FOLDER:/data" tartancalib:omni /bin/bash source ./catkin_ws/devel/setup.bash
