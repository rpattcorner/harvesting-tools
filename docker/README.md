# Docker for Harvesting Tools

## Overview
This subproject aims to provide a functional Docker image with all tools and documentation to enable data rescuers to be immediately productive.  Goals include:

* The basic Docker image (now a dockerfile; later versions will go to Docker hub)
* All required packages, including tools such as a text editor
* Working examples for each of the tools

Current state (v0.1) is a docker image with basic utilities, a cloned harvesting tools repository and two versions of python installed.

## Usage
To build: 
Path to dockerfile location
`docker build -t datarescue-tools .`

To run:
`docker run -e TERM=linux -i -t datarescue-tools bash`

## Tool Based Notes
### Tool location
All the tools are cloned from the harvesting-tools repository in the `/opt/datarescue/harvesting-tools` directory:

```
root@46bf5498a8a8:/opt/datarescue/harvesting-tools# ls /opt/datarescue/harvesting-tools/
CONTRIBUTING.md  README.md                ftp                    python-scraper      url-check  wget-loop
LICENSE          epa-envirofacts-scraper  jquery-url-extraction  ruby-watir-collect  utils
```

### AWS S3 Access
The AWS command line tools are preinstalled, courtesy of the python-scraper project (thanks!).  So you can directly upload to s3 after obtaining a token from the Archiver application and updating your credentials.

```
root@46bf5498a8a8:/# aws configure
AWS Access Key ID [None]:
...
```

and then something like: `aws s3 cp output.zip s3://drp-upload/remote/ADD_UUID_HERE.zip --region us-east-1`

### Really Big Uploads
This hasn't been tested yet, but in theory if this docker container were run on an AWS US-East instance, or container service, it would have potentially very inexpensive and very fast access to the datarescue s3 buckets.

Use at your own risk and expense :)


### epa-envirofacts-scraper
Appears to work correctly in this version, requires python3.  Run it like this:
`python3 epa-envirofacts-scraper -o ./downloaded-data`

Expect something like the below.  You may need to provide additional space for storage...
```
root@6362b5dbf151:/opt/datarescue/harvesting-tools# python3 epa-envirofacts-scraper -o ./downloaded-data
INFO 2017-02-24 20:44:51,619 __main__.py(15) Starting archiving process
INFO 2017-02-24 20:44:51,620 archiver.py(16) Created dir: /opt/datarescue/harvesting-tools/downloaded-data
INFO 2017-02-24 20:44:51,960 scraper.py(78) Pulling tables for model: /enviro/radinfo-model
...
```
### python-scraper
Beautiful soup parsing appears to work fine using the www.example.com example - just uncomment it in scraper.py and run:

`python3 scraper.py --output .`

Selenium scraping now appears to work using www.example.com example as well.  Here you must uncomment the PhantomJS headless browser (available only in this fork) and comment out the Firefox browser, e.g.

```
    #driver = webdriver.Firefox() # needs geckodriver in PATH
    #driver = webdriver.Chrome() # needs chromedriver in PATH
    driver = webdriver.PhantomJS() # needs an install of phantomjs, see dockerfile for example
```