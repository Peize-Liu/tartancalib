#!/bin/bash
#you need to image the repo dir into container
FOLDER=/media/khalil/ssd_data/data_set
IMAGE=omnitartancalib:latest

xhost +
if [ $# -eq 0 ]; then
  echo "[INFO] No start option, will start docker container only for application"
  START_OPTION=0
else
  echo "[INFO] Start option is ${1}"
  START_OPTION=$1
fi
if [ ${START_OPTION} == 1 ]; then
  echo "[INFO] Start docker container with mapping current dir to docker container"
  CURRENT_DIR=$(pwd)
  echo "$CURRENT_DIR will be mapped in to docker container with start option 1"
  docker run -it --rm -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$CURRENT_DIR:/catkin_ws/src/kalibr" \
    -v "$FOLDER:/data" ${IMAGE} /bin/bash
else
  echo "Start docker container for image transportation only"
  docker run -it --rm -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$FOLDER:/data" ${IMAGE} /bin/bash
fi

# docker run -it --rm -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
#     -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#     -v "$REPO_PATH:/catkin_ws/src/kalibr" \
#     -v "$FOLDER:/data" ${IMAGE} /bin/bash