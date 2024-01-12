#!/bin/bash

DETECTOR_ID="YOUR_DETECTOR_ID"

# Example Query: Are there any objects on either of the two black conveyor belts?
# Another view: https://www.buffalotracedistillery.com/visit-us/cameras/craft-bottling-hall.html
# And another: https://camera9.sazerac.com/#view
CONTAINER_NAME="bt_craft_conveyor_belts"
STREAM_URL="https://camera9.sazerac.com/mjpg/video.mjpg"

docker run --name ${CONTAINER_NAME} --detach groundlight/stream:0.4.4 \
    -t ${GROUNDLIGHT_API_TOKEN} \
    --streamtype file \
    -d ${DETECTOR_ID} \
    -s ${STREAM_URL} \
    -f 0.25  # ~ 1 frame every second, but in reality the stream library is bad at calculating this and it's more like 1 frame every 60 seconds

docker logs -f ${CONTAINER_NAME}