FROM ubuntu:18.04

# Perform an update and install
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    libpq-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel 
   

RUN mkdir /code
WORKDIR /code
COPY . /code

RUN ln -s /usr/pgsql-9.1/bin/pg_config /usr/sbin/pg_config

RUN pip3 install -r requirements.txt
RUN chmod +x /code/docker-entrypoint.sh
ENTRYPOINT [ "/code/docker-entrypoint.sh" ]