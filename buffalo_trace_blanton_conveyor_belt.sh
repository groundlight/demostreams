#!/bin/bash

DETECTOR_ID="YOUR_DETECTOR_ID"

# Example Query: Is there anything on the black conveyor belt within 6in/15cm of the end?
# Another view: https://www.buffalotracedistillery.com/visit-us/cameras/blanton-s-bottling-hall.html
# And another: http://camera.buffalotrace.com/mjpg/video.mjpg
CONTAINER_NAME="bt_blanton_conveyor_belt"
STREAM_URL="https://camera3.sazerac.com/mjpg/video.mjpg"

docker run --name ${CONTAINER_NAME} --detach groundlight/stream:0.4.4 \
    -t ${GROUNDLIGHT_API_TOKEN} \
    --streamtype file \
    -d ${DETECTOR_ID} \
    -s ${STREAM_URL} \
    -f 0.25  # ~ 1 frame every second, but in reality the stream library is bad at calculating this and it's more like 1 frame every 60 seconds

docker logs -f ${CONTAINER_NAME}