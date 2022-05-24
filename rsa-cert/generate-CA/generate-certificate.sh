openssl genrsa -out ca.key 2048

openssl req -sha256 -new -x509 -days 3650 -key ca.key -out ca.crt -newkey rsa:2048

openssl x509 -noout -text -in ca.crt

openssl genrsa -out server.key 2048

openssl req -new -sha256 -key server.key -reqexts v3_req -out server.csr

openssl ca -in server.csr -md sha256 -keyfile ca.key -cert ca.crt -extensions v3_req -out server.crt

mkdir -p demoCA/newcerts

touch demoCA/index.txt

echo 00 > demoCA/serial

openssl ca -in server.csr -md sha256 -keyfile ca.key -cert ca.crt -extensions v3_req -out server.crt -policy policy_anything
