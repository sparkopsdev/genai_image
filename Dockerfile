FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    ffmpeg \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN pip install --upgrade pip

RUN pip install \
    jupyterlab \
    ipywidgets \
    diffusers \
    transformers \
    accelerate \
    datasets \
    safetensors \
    torchvision \
    huggingface_hub \
    pillow \
    numpy \
    torch

EXPOSE 8888
