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
