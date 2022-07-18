**nc-link-adapter-plugin** is an ingress plugin for MTConnect Agents. The plugin runs inside the agent as an internal adapter. It collects data from NC-Link servers and provide the stream updates.

Here is a MTConnect agent configuration example using this NC-Link ingress plugin:
```
Devices = _metaagent_.xml
Port = 7979
Adapters
{
  NC-LINK_ADAPTER:NC-Link
  {
    uuid = d1
    mqtt = demo.mtconnect.org
    port = 1883

    #
    # Additional optional connection info
    # user =     <user's id>
    # password = <user's password>
    # cacert =   <location of cacert file. Format: PEM>

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
