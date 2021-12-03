**nc-link-adapter-plugin** is an ingress plugin for the MetaAgent. The plugin works as an interal adapter in the MetaAgent. It collects data from NC-Link servers and provide the stream updates to the MetaAgent.

MetaAgent configuration example using this NC-Link ingress plugin:
```
Devices = _metaagent_.xml
Port = 7979
Adapters
{
  NC-LINK_ADAPTER:NC-Link
  {
    uuid = 189FFDD66F369F1
    mqtt = 27.17.57.163
    port = 1883

    #
    # Additional optional connection info
    # user =     <user's id>
    # password = <user's password>
    # cacert =   <location of cacert file>

    #
    # default useWebSocket is false
    # useWebSocket = <true or false>
    #

    # licenseKey: <your license key - default is demo mode if not provided>

    # option to override logger config for this adapter
    logger_config {
      output = file nc-link-adapter.log
      level = info
    }
  }
}
```