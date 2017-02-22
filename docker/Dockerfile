FROM ubuntu:latest

RUN apt-get -qq update && apt-get install wget curl vim git python python-pip python3 python3-pip -y

RUN mkdir /opt/datarescue && cd /opt/datarescue && git clone https://github.com/edgi-govdata-archiving/harvesting-tools.git

RUN cd /opt/datarescue/harvesting-tools/python-scraper && pip3 install -r requirements.txt