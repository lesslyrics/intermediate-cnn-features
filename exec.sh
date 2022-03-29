#!/bin/sh

sudo apt install curl

curl https://testbucket-1h.s3.amazonaws.com/test.mp4 --output test.mp4

python /feature_extraction.py --video_list videos.txt --network vgg --framework>

rm test.mp4

