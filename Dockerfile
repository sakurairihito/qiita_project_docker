FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    curl \
    ca-certificates \
    git \
    zip \
    vim \
    && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* # clean up

WORKDIR /app

COPY pyproject.toml ./

RUN pip install poetry

RUN poetry config virtualenvs.create false \
    && poetry install