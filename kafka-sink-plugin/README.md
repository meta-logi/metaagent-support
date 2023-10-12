**kafka-sink-plugin** is a Kafka egress plugin for MTConnect Agents.  The plugin streams data from the agent to Kafka broker server(s).

Here is a MetaAgent configuration example using this Kafka egress plugin:
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
  KAFKA {
    #
    # Kafka broker list
    #
    KafkaBrokers = localhost:9093

    # various publish topics
    # topic for assets, default is none (disabled)
    KafkaTopicDeviceAsset = MTConnect.NewDeviceAsset

    # topic for probe info, default is none (disabled)
    KafkaTopicDeviceProbe = MTConnect.NewDeviceProbe

    # topic for item info, default is none (disabled)
    KafkaTopicDeviceItemInfo = MTConnect.NewDeviceItemInfo

    # topic for node tree, default is none (disabled)
    KafkaTopicDeviceNodeTree = MTConnect.NewDeviceNodeTree

    # topic for device data, default is MTConnect.DeviceData
    KafkaTopicDeviceData = MTConnect.NewDeviceData

    # batchSize = <# of records to be processed in a batch, default is 100>
    batchSize = 200

    # in demo mode, each data may only get updated every 20 seconds
    #licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file kafka-sink.log
      level = info
    }
  }
}
```
