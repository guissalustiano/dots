!# /bin/bash

IMAGE_PATH='/tmp/bg.jpeg'
IMAGE_URL='https://source.unsplash.com/daily'

curl -L -o $IMAGE_PATH $IMAGE_URL
feh --bg-fill $IMAGE_PATH 
rm $IMAGE_PATH
