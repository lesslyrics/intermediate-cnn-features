#!/bin/sh

apt install curl

curl https://testbucket-1h.s3.amazonaws.com/test.mp4 --output test.mp4

python /feature_extraction.py --video_list videos.txt --network vgg --framework tensorflow --output_path test --tf_model vgg_16.ckpt

rm test.mp4

