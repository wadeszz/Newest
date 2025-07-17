FROM python:3.10-slim

RUN apt update && apt install -y \
    openjdk-17-jdk \
    git zip unzip build-essential \
    libncurses5 libstdc++6 libffi-dev libssl-dev \
    python3-pip python3-dev libbz2-dev zlib1g-dev liblzma-dev \
    libtiff5 libjpeg-dev libopenjp2-7 libwebp-dev libfreetype6-dev \
    libharfbuzz-dev libfribidi-dev libxcb1 libgl1-mesa-glx \
    libgl1-mesa-dev libgles2-mesa-dev libsdl2-dev \
    libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    libportmidi-dev libswscale-dev libavformat-dev libavcodec-dev

RUN pip install --upgrade pip setuptools
RUN pip install cython==0.29.21 buildozer

WORKDIR /app
COPY project /app
COPY build.sh /app/build.sh
RUN chmod +x /app/build.sh && /app/build.sh
