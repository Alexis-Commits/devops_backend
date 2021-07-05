FROM ubuntu:16.04

# Perform an update and install
RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2 \
    apt-transport-https \
    curl \
    language-pack-el-base \
    language-pack-en-base \
    libapache2-mod-wsgi-py3 \
    libffi-dev \
    libpq-dev \
    libssl-dev \
    postgresql \
    postgresql-contrib \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \

RUN mkdir /code
WORKDIR /code
COPY . /code

RUN pip3 install -r requirements.txt
RUN chmod +x /code/docker-entrypoint.sh
ENTRYPOINT [ "/code/docker-entrypoint.sh" ]