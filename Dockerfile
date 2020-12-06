FROM python:3.6.8

ENV PYTHONUNBUFFERED  1

COPY ./requirements.txt /requirements.txt 
RUN apt-get update && apt-get install -y gettext libgettextpo-dev graphviz default-jdk
RUN pip install -r /requirements.txt

RUN mkdir /app 
WORKDIR /app 
COPY ./app /app 

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser user
USER user
