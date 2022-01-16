**elasticsearch-sink-plguin** is a ElasticSearch egress plugin for the MetaAgent.  The plugin streams data from the MetaAgent to a designated ElasticSearch v7.9+ server.

MetaAgent configuration example using this ElasticSearch egress plugin:
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
  ELASTICSEARCH {
    #
    # ElasticSearch server info
    #
    serverUrl = http://192.168.0.132:9200

    #
    # Additional optional connection info
    # user = <user id>
    # password = <user password>

    # indexName = <index name associated with the data, default is mtconnect>
    indexName = mtconnect

    # batchSize = <# of records to be processed in a batch, default is 100>
    batchSize = 100

    # licenseKey = <your license key - default is demo mode if not provided>
    # in demo mode, each data may only get updated every 20 seconds

    # override logger config 
    logger_config {
      output = file elasticsearch-sink.log
      level = info
    }
  }
}
```
