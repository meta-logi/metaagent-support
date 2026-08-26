**spb-gateway** is a server process that connects to MTConnect agents and streams data from the agents to Sparkplug B's MQTT broker.

## Multi-Broker Support

The SPB Gateway now supports connecting to **multiple MQTT brokers** for failover and redundancy. You can configure a comma-separated list of brokers, and the gateway will automatically switch to the next broker if the current connection fails.

### Configuration Examples

**Single Broker:**
```yaml
server:
  mqtt: ignition.metalogi.io
  port: 1883
```

**Multiple Brokers (default port):**
```yaml
server:
  mqtt: broker1.example.com,broker2.example.com,broker3.example.com
  port: 1883
```

**Multiple Brokers (with individual ports):**
```yaml
server:
  mqtt: broker1.example.com:1883,broker2.example.com:8883,broker3.example.com:1883
```

**Mixed Configuration:**
```yaml
server:
  mqtt: broker1.example.com:1883,broker2.example.com,broker3.example.com:8883
  port: 1883
```
> Note: When a port is specified in the broker address (e.g., `broker:8883`), it overrides the default `port` setting.

### Failover Behavior

- **Automatic Failover**: If connection to the current broker is lost, the gateway automatically connects to the next broker
- **Manual Switching**: Send a Sparkplug "Node Control/Next Server" command to manually switch brokers
- **Reconnection**: Continuously tries to reconnect, cycling through all configured brokers

---

## Usage
```
spb-gateway [config file - default is spb-gateway.cfg]
```

## Complete Configuration Example
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
    # mqtt connect info 
    #
    # Single broker:
    # mqtt : <mqtt server hostname or ip>
    #
    # Multiple brokers for failover (comma-separated):
    # mqtt : broker1.example.com,broker2.example.com,broker3.example.com
    #
    # Multiple brokers with individual ports:
    # mqtt : broker1.example.com:1883,broker2.example.com:8883,broker3.example.com:1883
    #
    # port : <default mqtt server port # - used when not specified in broker address>
    #
    # TLS/SSL configuration:
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
