<h1>OPC UA Certificate and Key</h1>
MetaAgent OPC UA client tools like opcua-adapter, opcua-adapter-plugin and opcua-dataminer can discover the available secured connection endpoints. Client certificate and key are only required if the target OPC UA server is configured with user login/password and encryption.
<br />
<br />

|OPC UA Server User Info | Server Cert/Key |	OPC UA Client User Set up |	Client Cert/Key |
| ----------| --------------- |------------ | ------------- |
|Anonymous	| No	| Anonymous	| Any |
|User/Password	| No	| User/Password	| Any |
|Anonymous | Yes	| Anonymous	| Any |
|User/Password |	Yes	| User/Password |	**Required** |

<h1>certgen</h1>


The tool **certgen** is to generate your self-signed certificate which can be used for OPC UA client or server set up.

Update the field **subjectAltName**, **countryName**, **stateOrProvinceName**, **organizationName** and **commonName** in the ssl.conf.

```
[ req ]
default_bits = 2048
default_md = sha256
distinguished_name = subject
req_extensions = req_ext
x509_extensions = req_ext
string_mask = utf8only
prompt = no

[ req_ext ]
basicConstraints = CA:FALSE
nsCertType = client, server
keyUsage = nonRepudiation, digitalSignature, keyEncipherment, dataEncipherment, keyCertSign
extendedKeyUsage= serverAuth, clientAuth
nsComment = "OpenSSL Generated Certificat"
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid,issuer
subjectAltName=URI:urn:open62541.server.application

[ subject ]
countryName = US
stateOrProvinceName = CA
organizationName = Your Organization
commonName = Your Name
```
