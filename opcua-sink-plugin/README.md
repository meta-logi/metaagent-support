**opcua-sink-plguin** is an OPC UA interface provider plugin for the MetaAgent.  The plugin runs a OPC UA server in the MetaAgent to serve OPC UA clients according to MTConnect OPC UA Companion Specification.

MetaAgent configuration example using this OPC UA egress plugin:
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
  OPCUA {
    #
    # server name display in OPC UA discovery
    #
    name = MTConnect/OPC UA Gateway Demo

    # listen on port #
    port = 4840

    # OPC UA event severity level for MTConnect Warning and Fault conditions
    warningEventSeverity = 500
    faultEventSeverity = 1000

    #
    # Additional optional connection info
    # user =     <user's id>
    # password = <user's password>
    # cert =     <location of certificate file>
    # key =      <location of key file>

    # licenseKey: <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file opcua-sink.log
      level = info
    }
  }
}
```
