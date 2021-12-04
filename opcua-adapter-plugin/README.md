**opcua-adapter-plugin** is an ingress plugin for the MetaAgent. The plugin works as an interal adapter in the MetaAgent. It collects data from OPC UA servers and provide the stream updates to the MetaAgent.

MetaAgent configuration example using this OPC UA ingress plugin:
```
Devices = _metaagent_.xml
Port = 7979
Adapters
{
  OPCUA_ADAPTER:OPCUA
  {
    url = opc.tcp://demo.mtconnect.org:4840

    # namespaceFilter= <comma separated list of node's id using regex matching. stream data only from this node or below>
    namespaceFilter= ns=3

    # sampleInterval = <the fastest rate at which OPC UA server's monitored items should be accessed and evaluated (ms)>
    #                 default is 0, indicates that it should use the fastest practical rate

    #
    # Additional optional connection info
    # user =     <user's id>
    # password = <user's password>
    # cert =     <location of certificate file>
    # key =      <location of key file>

    # licenseKey: <your license key - default is demo mode if not provided>

    # option to override logger config for this adapter
    logger_config {
      output = file opcua.log
      level = info
    }
  }
}
```
