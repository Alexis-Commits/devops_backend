FROM python:3.8.2-slim-buster
RUN apt update & apt -y upgrade
RUN apk update && apk add libpq
RUN apk add --virtual .build-deps gcc python-dev musl-dev postgresql-dev
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY . /code
RUN pip install -r requirements.txt
RUN chmod +x /code/docker-entrypoint.sh
ENTRYPOINT [ "/code/docker-entrypoint.sh" ]