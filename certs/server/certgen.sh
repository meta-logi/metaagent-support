echo "========================================================"
echo Generate the fake certificate authority's (CA) signing key
openssl genrsa -des3 -out ca.key 2048
echo "========================================================"
echo Generate a certificate signing request for the fake CA
echo "*** Give the organization a name like 'Fake Authority' ***"
openssl req -new -key ca.key -out ca-cert-request.csr -sha256
echo "========================================================"
echo Create the fake CA's root certificate
openssl x509 -req -in ca-cert-request.csr -signkey ca.key -out ca-root-cert.crt -days 365 -sha256
echo "========================================================"
echo "Create the server / mqtt broker's keypair"
openssl genrsa -out server.key 2048
echo "========================================================"
echo Create a certificate signing request using the server key to send to the fake CA for identity verification
echo "*** Give the organization a name like 'Ignition MQTT Broker' ***"
openssl req -new -key server.key -out server-cert-request.csr -sha256
echo "========================================================"
echo "Create a new certificate & sign it with all the power of your fake authority"
openssl x509 -req -in server-cert-request.csr -CA ca-root-cert.crt -CAkey ca.key -CAcreateserial -out server.crt -days 360
