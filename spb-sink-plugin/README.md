**spb-sink-plugin** is a Sparkplug B interface provider plugin for MTConnect Agents. The plugin streams data from the agent to the Sparkplug B's MQTT broker server.

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
    #mqtt = <mqtt server hostname or ip>
    #port = <mqtt server port #>
    #user = <user id>
    #password = <password>
    mqtt = ignition.metalogi.io
    port = 1883
    user = demo
    password = demo

    #
    # Secured connection info
    # useTLS = [true, false]  default is false
    # cacert = <location of CA certificate file. Format: PEM>
    # cert = <location of certificate file. Format: PEM>
    # key  = <location of key file. Format: PEM>


    #
    # Sparkplug B info
    #
    # The Ignition tags are constructed under Edge Nodes / <namespace> / <edgeNodeId>
    # 
    namespace = MTConnect Devices
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
