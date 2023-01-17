#!/bin/sh

openssl req -subj '/CN=localhost/O=ClimateFriendly/C=AU' \
    -new -newkey rsa:2048 -sha256 -days 1000 -nodes -x509 -keyout default.key -out default.crt