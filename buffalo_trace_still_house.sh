#!/bin/bash

DETECTOR_ID="YOUR_DETECTOR_ID"

# Example Query: Is the "High Wine" still on? (does it look like there is liquid flowing in the barrel?)
# Another view: https://www.buffalotracedistillery.com/visit-us/cameras/still-house.html
CONTAINER_NAME="bt_still_house"
STREAM_URL="http://camera2.buffalotrace.com/mjpg/video.mjpg"

docker run --name ${CONTAINER_NAME} --detach groundlight/stream:0.4.4 \
    -t ${GROUNDLIGHT_API_TOKEN} \
    --streamtype file \
    -d ${DETECTOR_ID} \
    -s ${STREAM_URL} \
    -f 0.5  # ~ 2 frame every second, but in reality the stream library is bad at calculating this and it's more like 1 frame every 60 seconds

docker logs -f ${CONTAINER_NAME}