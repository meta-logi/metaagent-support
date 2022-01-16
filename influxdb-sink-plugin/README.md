**InfluxDB-sink-plguin** is a InfluxDB egress plugin for the MetaAgent.  The plugin streams data from the MetaAgent to a designated InfluxDB v2.0+ server.

MetaAgent configuration example using this InfluxDB egress plugin:
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
  INFLUXDB {
    #
    # InfluxDB server info
    #
    serverUrl = http://192.168.0.132:8086

    #
    # Additional optional connection info
    # organization = <organization name - default is mtconnect>
    # bucket = <bucket name - default is mtconnect>
    # autKey = <user's authorization key>
    organization = mtconnect
    bucket = metaagent
    authKey = dummyKey

    # batchSize = <# of records to be processed in a batch, default is 100>
    batchSize = 100

    # licenseKey = <your license key - default is demo mode if not provided>
    # in demo mode, each data may only get updated every 20 seconds

    # override logger config 
    logger_config {
      output = file influxdb-sink.log
      level = info
    }
  }
}
```
