BAG_PATH=/data/omnicam/omni_calibration_CAMABCD-split.bag

rosrun kalibr tartan_calibrate   --bag $BAG_PATH\
  --target /data/target/april_6x6.yaml\
  --topics  /oak_ffc_4p/image_CAM_A/compressed\
            /oak_ffc_4p/image_CAM_B/compressed\
            /oak_ffc_4p/image_CAM_C/compressed\
            /oak_ffc_4p/image_CAM_D/compressed\
  --min-init-corners-autocomplete 30 \
  --min-tag-size-autocomplete 2 \
  --models omni-radtan omni-radtan omni-radtan omni-radtan\
  --save_dir /data/output \
  --intrinsic-prarameters /catkin_ws/src/kalibr/intrinsic_parameters_for_test.yaml