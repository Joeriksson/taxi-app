# Pull base image
FROM python:3.8-alpine

RUN apk update && apk add build-base python-dev py-pip jpeg-dev zlib-dev openssl-dev gcc libffi-dev postgresql-dev

# Set env vars
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working dir
WORKDIR /code

# Install dependencies
#COPY Pipfile Pipfile.lock /code/
#RUN pip install pipenv && pipenv install --system
COPY requirements.txt /code/
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

# Copy project
COPY . /code/
