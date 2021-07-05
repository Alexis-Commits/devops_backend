FROM ubuntu:16.04

# Perform an update and install
RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2 \
    apt-transport-https \
    curl \
    libpq-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel 
  


RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 2 /
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1

RUN apt-get install python3.6 /
    libpython3.6

RUN rm /usr/bin/python3 &&  ln -s python3.6 /usr/bin/python3

RUN mkdir /code
WORKDIR /code
COPY . /code

RUN ln -s /usr/pgsql-9.1/bin/pg_config /usr/sbin/pg_config

RUN pip3 install -r requirements.txt
RUN chmod +x /code/docker-entrypoint.sh
ENTRYPOINT [ "/code/docker-entrypoint.sh" ]