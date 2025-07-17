FROM python:3.10-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    python3-pip \
    libffi-dev \
    libssl-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libbz2-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
RUN pip install --upgrade pip setuptools
RUN pip install cython==0.29.21 buildozer

WORKDIR /app
COPY project /app
COPY build.sh /app/build.sh
RUN chmod +x /app/build.sh && /app/build.sh
