ARG VARIANT=3-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

ARG DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED 1

RUN sudo apt-get update && \
    sudo apt-get install -y python3-dev libavcodec-dev libavformat-dev \
    libswresample-dev libswscale-dev libfreetype6-dev libfribidi-dev libsdl2-dev \
    libsdl2-image-dev libsdl2-gfx-dev libsdl2-mixer-dev libsdl2-ttf-dev libjpeg-dev

RUN pip install -U cython future six typing pefile requests ecdsa

COPY scripts /usr/src/.devcontainer-scripts
RUN find /usr/src/.devcontainer-scripts -type f -name '*.sh' -exec chmod +x {} \;
