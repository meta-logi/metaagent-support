**InfluxDB-sink-plugin** is a InfluxDB egress plugin for MTConnect Agents.  The plugin streams data from the agent to a designated InfluxDB v2.0+ server.

MetaAgent configuration example using this InfluxDB egress plugin:
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
  INFLUXDB {
    #
    # InfluxDB server info
    #
    InfluxDBUrl = http://localhost:8086

    #
    # Additional optional connection info
    # InfluxDBOrganization = <organization name - default is mtconnect>
    # InfluxDBBucket = <bucket name - default is mtconnect>
    # InfluxDBAuthKey = <user's authorization key>
    InfluxDBOrganization = YourOrganization
    InfluxDBBucket = YourBucket
    InfluxDBAuthKey = YourAuthKey

    # batchSize = <# of records to be processed in a batch, default is 100>
    batchSize = 200

    # in demo mode, each data may only get updated every 20 seconds
    #licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file influxdb-sink.log
      level = info
    }
  }
}
```
