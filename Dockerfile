# syntax=docker/dockerfile:1.2

# Resources:
# This Dockerfile provides a MWE to get the application development environment going
# * https://docs.docker.com/language/nodejs/build-images/
# * https://hub.docker.com/_/node
FROM node:17

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    python3 \
    python3-distutils \
    python3-setuptools \
    python3-wheel \
    python3-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

COPY . .

RUN python3 -m pip install pre-commit==2.19.0 --no-cache-dir && pre-commit install
