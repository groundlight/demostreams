# Groundlight Demo Internet Streams
Scripts for easy setup of Groundlight detectors based on livestreams available on the public internet.

## How to use:
1. Choose one of the example streams in this repo (or bring your own stream) and decide on a YES/NO
    query to monitor on that stream. For example, a question that could be asked about this
    Shibuya Crossing stream is "Are there any pedestrians currently crossing the intersection?".
2. Navigate to https://app.groundlight.ai, sign up for a new account or login to an existing account.
3. After logging in, you will land on the "Detectors" page. In the top right, click the button that
   says "Create New".
4. On the "Create New Detector" screen, enter your query, choose an informative name for your detector,
    and set a minimum confidence level. Predictions from our ML models must meet this confidence level
    or they will be escalated to a human labeler. Optionally add notes to provide detail about your specific query for to to our labelers. When you are ready, click "Create".
5. You will be brought to your new detector's detail page. The URL will follow the pattern:
```
https://app.groundlight.ai/reef/detectors/${YOUR_DETECTOR_ID}
```
6. Copy your detector id, and paste it into the script corresponding to the stream you want to use.
7. Navigate to https://app.groundlight.ai/reef/my-account/api-tokens and follow the flow to create
    a new api token. Keep track of this token, as it is needed in the next step.
8. Finally, start capturing frames from the stream and sending them to your Groundlight detector by
    running the script. Be sure to set your `GROUNDLIGHT_API_TOKEN` env variable. For example,
```bash
GROUNDLIGHT_API_TOKEN="your_groundlight_api_token" bash ./shibuya_crossing.sh
```

## Requirements:
Streams in this repo are based on [groundlight/stream](https://github.com/groundlight/stream).
Therefore, `docker` is required.

## Tips:
Sometimes docker containers based on `groundlight/stream` will crash due to issues with the stream they are watching. It can be useful to add
a line like the following to your crontab via `crontab -e`:
```
0 */1 * * * /usr/bin/docker restart shibuya_crossing
```
The path to your docker executable may be different. Run `which docker` to determine the correct path. This will restart the specified container every hour - which will work whether or not the stream crashed.

Additional features of `groundlight/stream` (such as motion detection) can be viewed [here](https://github.com/groundlight/stream#useage).