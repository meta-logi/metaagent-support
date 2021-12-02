**opcua-gateway** is a server process that conntects to MTConnect agents and provide an OPC UA interface according to MTConnect OPC UA Companion Specification. 

Usage:
```
opcua-gateway [config file - default is opcua-gateway.cfg]
```

Configuration Example:
```
# MTConnect agents information
agents:
    #
    # - name: <device name>
    #   url:  <MTConnect Agent url>
    #   freq: <poll period in seonds>
    #
    - name: GFAgie01
      url:  https://smstestbed.nist.gov/vds/GFAgie01
      freq: 1
    - name: Mazak-5610
      url:  http://mtconnect.mazakcorp.com:5610
      freq: 1
    - name: Mazak-5611
      url:  http://mtconnect.mazakcorp.com:5611
      freq: 1
    - name: Mazak-5612
      url:  http://mtconnect.mazakcorp.com:5612
      freq: 1

logging:
    # serverity can be debug, info, warn, error or off, default is info
    severity: info

#
# opcua server program name and its discovery port #
#
server: 
    #
    # server name display in OPC UA discovery
    #
    name: MTConnect/OPC UA Gateway Demo
    port: 4840

    # initial wait time before reading data from agents
    initialWaitTime:      10    

    # OPC UA event severity level for MTConnect Warning and Fault conditions
    warningEventSeverity: 500   
    faultEventSeverity:   1000   

    #useWebSocket: TRUE
    #
    # Additional optional connection info
    # user:     <user's id>
    # password: <user's password>
    # cert:     <location of certificate file>
    # key:      <location of key file>

    # licenseKey: <your license key - default is demo mode if not provided>
```
