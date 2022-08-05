**elasticsearch-sink-plugin** is a ElasticSearch egress plugin for MTConnect Agents.  The plugin streams data from the agent to a designated ElasticSearch v7.9+ server.

Here is a MetaAgent configuration example using this ElasticSearch egress plugin:
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
    ElasticSearchUrl = http://localhost:9200

    #
    # Additional optional connection info
    #ElasticSearchUser = <your user id>
    #ElasticSearchPassword = <your user password>

    # indexName = <index name associated with the data, default is mtconnect>
    ElasticSearchIndexName = mtconnect

    # batchSize = <# of records to be processed in a batch, default is 100>
    batchSize = 200

    # in demo mode, each data may only get updated every 20 seconds
    #licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file elasticsearch-sink.log
      level = info
    }
  }
}
```
