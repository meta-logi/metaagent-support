openssl genrsa -out key.pem 2048
openssl req -x509 -days 365 -new -out public.pem -key key.pem -config ssl.conf
openssl x509 -in public.pem -inform PEM -out public.cert.der -outform DER
