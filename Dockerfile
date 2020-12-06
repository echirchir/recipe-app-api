FROM python:3.6-alpine

ENV PYTHONUNBUFFERED  1

COPY ./requirements.txt /requirements.txt 
RUN apk add --update --no-cache postgresql-client
RUN apk add postgresql-dev=9.6.10-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.5/main gcc
RUN apk add postgresql-libs libpq --no-cache
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app 
WORKDIR /app 
COPY ./app /app 

RUN adduser -D user
USER user
