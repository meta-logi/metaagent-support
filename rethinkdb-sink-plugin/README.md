**RethinkDB-sink-plguin** is a RethinkDB egress plugin for the MetaAgent.  The plugin streams data from the MetaAgent to a designated RethinkDB v2.4+ server.

MetaAgent configuration example using this RethinkDB egress plugin:
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
  RETHINKDB {
    #
    # RethinkDB location = <host name>:<port #>
    #
    location = 192.168.0.132:28015

    #
    # Additional optional connection info
    # dbname   = <database name - default is mtconnect>
    # authkey  = <admin's password>
    dbname = test
    authkey = secret

    #
    # table info
    # probeInfo_table = <table name for probe info - default is probeInfo> 
    # dataInfo_table  = <table name for data info - default is dataInfo>
    # data_table = <table name for storing current data values - default is mtdata>
    #
    probeInfo_table = myProbeInfo
    dataInfo_table = myDataInfo
    data_table = myData

    # licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file rethinkdb-sink.log
      level = info
    }
  }
}
```
