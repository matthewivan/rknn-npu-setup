#!/bin/bash

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y \
    python3-pip \
    cmake \
    libxslt1-dev \
    libglib2.0-0 \
    libgl1-mesa-glx \
    libprotobuf-dev \
    pkg-config \
    libhdf5-dev

# Optionally, you can also install pip packages if needed
pip install --upgrade pip
pip install -r pip-requirements-rknn-whl/requirements_cp39-2.0.0b0.txt
