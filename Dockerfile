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
    python3-wheel 
   
RUN apt-get install software-properties-common -y

RUN apt-get update && \
        apt-get install -y software-properties-common vim
        add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update -y
RUN apt-get update
RUN apt-get install python3.6 libpython3.6 -y

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 2 -y
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 -y

RUN rm /usr/bin/python3
RUN ln -s python3.6 /usr/bin/python3

   
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