FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get install -y curl
RUN apt-get install -y python3-distutils
RUN apt-get install -y python3.8

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.8 get-pip.py

WORKDIR /app

COPY ./recommender ./recommender
COPY requirements.txt requirements.txt

RUN python3.8 -m pip install torch torchvision
RUN python3.8 -m pip install . --no-cache-dir
