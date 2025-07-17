FROM python:3.9-slim

# Установка зависимостей
RUN apt update && apt install -y \
    git zip unzip openjdk-17-jdk \
    build-essential python3-pip python3-dev \
    libbz2-dev zlib1g-dev liblzma-dev \
    libfreetype6-dev libjpeg-dev libpng-dev libtiff5-dev libwebp-dev \
    libharfbuzz-dev libfribidi-dev libxcb1 libgl1-mesa-glx \
    libgles2-mesa-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    libportmidi-dev libswscale-dev libavformat-dev libavcodec-dev \
    && rm -rf /var/lib/apt/lists/*

# Установка buildozer и Cython
RUN pip install --no-cache-dir buildozer cython

# Копируем проект
WORKDIR /app
COPY . /app

# Разрешение на выполнение build.sh
RUN chmod +x build.sh

# Запуск сборки
CMD ["./build.sh"]
