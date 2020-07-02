FROM python:3-alpine
LABEL maintainer Zach Valenta
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /docker-flask-sqlite-skeleton
COPY requirements.txt /docker-flask-sqlite-skeleton
RUN python -m pip install -r requirements.txt
COPY . /docker-flask-sqlite-skeleton
CMD flask run --host 0.0.0.0
