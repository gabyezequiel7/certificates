openssl genrsa -out rootCAKey.pem 2048
# Generate private key rsa

openssl req -x509 -sha256 -new -nodes -key rootCAKey.pem -days 3650 -out rootCACert.pem
# Generate cert with private key and signature with hash sha256
