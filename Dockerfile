FROM python:3.10-slim

RUN apt-get update && apt-get install -y     git zip unzip build-essential     python3-pip python3-dev libbz2-dev zlib1g-dev liblzma-dev     libfreetype6-dev libjpeg-dev libpng-dev     libtiff5 libharfbuzz-dev libfribidi-dev libxcb1 libgl1-mesa-glx     libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev     libportmidi-dev libswscale-dev libavformat-dev libavcodec-dev

WORKDIR /app

COPY project /app/project
COPY build.sh /app/build.sh

RUN pip install --upgrade pip
RUN pip install buildozer cython

WORKDIR /app/project

RUN chmod +x /app/build.sh && /app/build.sh
