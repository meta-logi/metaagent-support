**opcua-adapter** is a MTConnect adapter process to collect data from OPC UA servers and provide the stream updates for MTConnect Agent according to the requirements of MTConnect specification. 

Usage:
```
opcua-adapter [config file - default is opcua-adapter.cfg]
```

Configuration Example:
```
# This configuration is for MetaAgent opcua-adapter
#
# OPC UA Server connection info
#
OpcUAServer:
    name: OPCUA
    # url: <opcua server's url>
    url: opc.tcp://milo.digitalpetri.com:62541/milo

    # namespaceFilter: <comma separated list of node's id using regex matching. stream data only from this node or below>
    namespaceFilter: ns=2;s=Dynamic

    # sampleInterval: <the fastest rate at which OPC UA server's monitored items should be accessed and evaluated (ms)>
    #                 default is 0, indicates that it should use the fastest practical rate

    #
    # Additional optional connection info
    # user:     <user's id>
    # password: <user's password>
    # cert:     <location of certificate file>
    # key:      <location of key file>

#
# OPC UA MTConnect Adapter setting
#
server:
    # port: <port # to listen on>
    port: 7878

    # licenseKey: <your license key - default is demo mode if not provided>

logging:
    # serverity can be debug, info, warn, error or off, default is info
    severity: info

    #
    # suppress timestamp, default is false
    # messageOnly: <true or false>
```
