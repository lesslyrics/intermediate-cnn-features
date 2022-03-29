#Deriving the latest base image
FROM python:3


WORKDIR /



COPY * /
COPY nets/* /nets/


RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

RUN pip install virtualenv
RUN virtualenv venv
RUN . venv/bin/activate

RUN pip install -r requirements.txt


RUN wget http://download.tensorflow.org/models/vgg_16_2016_08_28.tar.gz
RUN tar -xvf vgg_16_2016_08_28.tar.gz


RUN pip install tensorflow
RUN pip install --upgrade tf_slim

RUN mkdir test

RUN chmod +x exec.sh

#CMD instruction should be used to run the software

CMD bash exec.sh
#ENTRYPOINT [ "python", "/feature_extraction.py"]
#RUN [ "python", "/feature_extraction.py --video_list videos.txt --network vgg --framework tensorflow --output_path test --tf_model vgg_16.ckpt"]
