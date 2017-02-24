FROM ubuntu:latest

RUN apt-get -qq update && apt-get install -y \
	wget \
	curl \
	vim \
	git \
	groff \
	dos2unix \
	sudo \
	python \
	python-pip \
	python3 \
	python3-pip 

COPY installPhantom.sh /tmp/

RUN dos2unix /tmp/installPhantom.sh && bash /tmp/installPhantom.sh

RUN mkdir /opt/datarescue && cd /opt/datarescue && git clone https://github.com/edgi-govdata-archiving/harvesting-tools.git

RUN cd /opt/datarescue/harvesting-tools/python-scraper && pip3 install -r requirements.txt