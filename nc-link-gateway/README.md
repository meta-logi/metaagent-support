**nc-link-gateway** is a server process that conntects to MTConnect agents and provide an NC-Link interface according to NC-Link Specification. 

Usage:
```
nc-link-gateway [config file - default is nc-link-gateway.cfg]
```

Configuration Example:
```
# MTConnect agents information
agents:
    #
    # - name: <device name>
    #   id:   <device id prefix for NC-Link>
    #   url:  <MTConnect Agent url>
    #   freq: <poll period in seconds>
    #
    # Sampling and upload interval (ms) for Samples, Events and Conditions - optional
    # Override defaultSampleInterval and defaultUploadInterval
    #
    #   sampleInterval_SAMPLE:      1000
    #   uploadInterval_SAMPLE:      3000
    #   sampleInterval_EVENT:       10000
    #   uploadInterval_EVENT:       30000
    #   sampleInterval_CONDITION:   10000
    #   uploadInterval_CONDITION:   30000
    #
    - name: Mazak-5717
      id:   Mazak-5717
      url:  http://mtconnect.mazakcorp.com:5717
      freq: 1
      sampleInterval_SAMPLE:      1000
      uploadInterval_SAMPLE:      3000
      sampleInterval_EVENT:       10000
      uploadInterval_EVENT:       30000
      sampleInterval_CONDITION:   10000
      uploadInterval_CONDITION:   30000

logging:
    # serverity can be debug, info, warn, error or off, default is info
    severity: info

# NC-Link and its MQTT port #
server: 
    port: 1883

    # default intervals in milliseconds for any data types
    #
    defaultSampleInterval:      60000
    defaultUploadInterval:      60000

    #
    # mode can be agent or adapter, default is agent
    #
    # mode: agent

    #
    # Additional optional connection info
    # user:     <user's id>
    # password: <user's password>

    #
    # default useWebSocket is false
    # useWebSocket: <true or false>
    #

    #
    # connect info used by agent
    #
    # cert:     <location of certificate file>
    # key:      <location of key file>

    #
    # connect info used by adapter
    # mqtt: <mqtt server ip address>
    # cacert: <location of cacert file>
    #

    # licenseKey: <your license key - default is demo mode if not provided>
```
