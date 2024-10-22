**spb-gateway** is a server process that connects to MTConnect agents and streams data from the agents to Sparkplug B's MQTT broker.

Usage:
```
spb-gateway [config file - default is spb-gateway.cfg]
```

Configuration Example:
```
# MTConnect agents information
agents:
    - name: Mazak
      url:  https://demo.metalogi.io/Mazak
      freq: 1
      assetFreq: 60
    - name: Okuma
      url:  https://demo.metalogi.io/OKUMA
      freq: 1
      assetFreq: 60

logging:
    # serverity can be debug, info, warn, error or off, default is info
    severity: info

# Sparkplug B's MQTT server and its MQTT port #
server: 
    #
    #
    # mqtt connect info 
    # cacert : <location of CA certificate file. Format: PEM>
    # cert : <location of certificate file. Format: PEM>
    # key  : <location of key file. Format: PEM>
    #
    mqtt : ignition.metalogi.io
    port : 1883
    user : demo
    password : demo

    #
    # additional optional connect info
    # clientId : <mqtt session's client id>
    # keepAlive : <PINGREQ interval>

    #
    # SparkPlug B info
    #
    # The Ignition tags are constructed under Edge Nodes / <groupId> / <edgeNodeId>
    # groupId : <grouping for this edge node>
    # edgeNodeId : <shoule be uniquely to represent this agent>
    # 
    groupId : MTConnect Devices
    edgeNodeId : Metalogi Node

    # licenseKey: <your license key - default is demo mode if not provided>
```
