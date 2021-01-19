#!/bin/bash
# Generate CA Key and Certificate
openssl req -x509 -sha256 -newkey rsa:4096 -keyout ca-root.key -out ca-root.crt -days 356 -nodes -subj '/CN=SSecure Cert Authority'
# Generate the Server Key, and Certificate 
openssl req -new -newkey rsa:4096 -keyout s-secure-server.key -out s-secure-server.csr -nodes -subj '/CN=s-secure.com'
# Sign with the CA Certificatec. 
openssl x509 -req -sha256 -days 365 -in s-secure-server.csr -CA ca-root.crt -CAkey ca-root.key -set_serial 01 -out s-secure-server.crt
# Generate the Client Key, and Certificate
openssl req -new -newkey rsa:4096 -keyout s-secure-client.key -out s-secure-client.csr -nodes -subj '/CN=SSecure'
# Sign with the CA Certificatee. 
openssl x509 -req -sha256 -days 365 -in s-secure-client.csr -CA ca-root.crt -CAkey ca-root.key -set_serial 02 -out s-secure-client.crt