FROM ubuntu:16.04

# Perform an update and install
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    libpq-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3.6 \
    python3.6-dev\
    python3-pip \
    python3.6-venv

RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel
  
RUN rm /usr/bin/python3 &&  ln -s python3.6 /usr/bin/python3

RUN mkdir /code
WORKDIR /code
COPY . /code

RUN ln -s /usr/pgsql-9.1/bin/pg_config /usr/sbin/pg_config

RUN pip3 install -r requirements.txt
RUN chmod +x /code/docker-entrypoint.sh
ENTRYPOINT [ "/code/docker-entrypoint.sh" ]