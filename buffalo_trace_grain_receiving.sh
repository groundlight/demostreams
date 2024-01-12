#!/bin/bash

DETECTOR_ID="YOUR_DETECTOR_ID"

# Example Query: Is there a there a truck parked in the grain receiving garage?
# Another view: https://www.buffalotracedistillery.com/visit-us/cameras/grain-receiving.html
CONTAINER_NAME=bt_grain_receiving
STREAM_URL="http://camera6.buffalotrace.com/mjpg/video.mjpg"

docker run --name ${CONTAINER_NAME} --detach groundlight/stream:0.4.4 \
    -t ${GROUNDLIGHT_API_TOKEN} \
    --streamtype file \
    -d ${DETECTOR_ID} \
    -s ${STREAM_URL} \
    -f 0.25  # ~ 1 frame every second, but in reality the stream library is bad at calculating this and it's more like 1 frame every 60 seconds

docker logs -f ${CONTAINER_NAME}