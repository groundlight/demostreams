#!/bin/bash

DETECTOR_ID="YOUR_DETECTOR_ID"

# Example Query: Are there any pedestrians currently crossing the intersection? If they are just standing near the curb, answer NO.
CONTAINER_NAME="shibuya_crossing"
STREAM_URL="https://www.youtube.com/watch?v=Lfl2Nj_QRXU"

docker run --name ${CONTAINER_NAME} --detach groundlight/stream:0.4.4 \
    -t "${GROUNDLIGHT_API_TOKEN}" \
    -d "${DETECTOR_ID}" \
    -s "${STREAM_URL}" \
    -f 0.033  # ~ 1 frame every 30 seconds

docker ps