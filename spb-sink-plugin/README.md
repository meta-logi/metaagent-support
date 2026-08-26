**spb-sink-plugin** is a Sparkplug B interface provider plugin for MTConnect Agents. The plugin streams data from the agent to the Sparkplug B's MQTT broker server.

## Multi-Broker Support

The plugin now supports connecting to **multiple MQTT brokers** for failover and redundancy. You can configure a comma-separated list of brokers, and the plugin will automatically switch to the next broker if the current connection fails.

### Configuration Examples

**Single Broker:**
```
mqtt = ignition.metalogi.io
port = 1883
```

**Multiple Brokers (default port):**
```
mqtt = broker1.example.com,broker2.example.com,broker3.example.com
port = 1883
```

**Multiple Brokers (with individual ports):**
```
mqtt = broker1.example.com:1883,broker2.example.com:8883,broker3.example.com:1883
```

**Mixed Configuration:**
```
mqtt = broker1.example.com:1883,broker2.example.com,broker3.example.com:8883
port = 1883
```
> Note: When a port is specified in the broker address (e.g., `broker:8883`), it overrides the default `port` setting.

### Failover Behavior

- **Automatic Failover**: If the connection to the current broker is lost, the plugin automatically connects to the next broker in the list.
- **Manual Switching**: You can trigger a switch to the next broker by sending a Sparkplug "Node Control/Next Server" command via MQTT.
- **Reconnection**: The plugin continuously tries to reconnect, cycling through all configured brokers.

---

## Complete Configuration Example

Here is a MetaAgent configuration example using this Sparkplug B egress plugin:
```
Devices = _metaagent_.xml
Port = 7979

Adapters
{
  Mazak
  {
    Host = demo.metalogi.io
    Port = 7879
  }
}

Sinks
{
  SparkPlugB {

    #
    # mqtt connect info
    # 
    # Single broker:
    # mqtt = <mqtt server hostname or ip>
    #
    # Multiple brokers for failover (comma-separated):
    # mqtt = broker1.example.com,broker2.example.com,broker3.example.com
    #
    # Multiple brokers with individual ports:
    # mqtt = broker1.example.com:1883,broker2.example.com:8883,broker3.example.com:1883
    #
    # port = <default mqtt server port # - used when not specified in broker address>
    # user = <user id>
    # password = <password>
    mqtt = ignition.metalogi.io
    port = 1883
    user = demo
    password = demo

    #
    # additional optional connect info
    # clientId = <mqtt session's client id, default is system-generated>
    # keepAlive = <PINGREQ interval, default is 30s>

    #
    # Secured connection info
    # useTLS = [true, false]  default is false
    # cacert = <location of CA certificate file. Format: PEM>
    # cert = <location of certificate file. Format: PEM>
    # key  = <location of key file. Format: PEM>

    #
    # Sparkplug B info
    #
    # The Ignition tags are constructed under Edge Nodes / <groupId> / <edgeNodeId>
    # groupId = <grouping for this edge node>
    # edgeNodeId = <shoule be uniquely to represent this agent>
    # 
    groupId = MTConnect Devices
    edgeNodeId = Metalogi Node

    # licenseKey = <your license key - default is demo mode if not provided>
    # override logger config
    logger_config {
      output = file spb-sink.log
      level = info
    }
  }
}
```
