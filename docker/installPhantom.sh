#!/bin/bash
VERSION=phantomjs-2.1.1-linux-x86_64
cd /usr/local/share/
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/$VERSION.tar.bz2
sudo tar jxvf $VERSION.tar.bz2
sudo ln -s /usr/local/share/$VERSION/ /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs/bin/phantomjs /usr/local/bin/phantomjs
