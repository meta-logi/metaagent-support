**kafka-sink-plguin** is a Kafka egress plugin for the MetaAgent.  The plugin streams data from the MetaAgent to Kafka broker server(s).

Device Data will be published in the topic MTConect.DeviceData.
 
Here is a MetaAgent configuration example using this Kafka egress plugin:
```
Devices = _metaagent_.xml
Port = 7979
Adapters
{
  Adapter_1
  {
    Host = demo.metalogi.io
    Port = 7878
  }
}

Sinks
{
  KAFKA {
    #
    # Kafka broker list
    #
    brokers = localhost:9092

    # batchSize = <# of records to be processed in a batch, default is 100>
    batchSize = 100

    # licenseKey = <your license key - default is demo mode if not provided>
    # in demo mode, each data may only get updated every 20 seconds

    # override logger config 
    logger_config {
      output = file kafka-sink.log
      level = info
    }
  }
}
```
