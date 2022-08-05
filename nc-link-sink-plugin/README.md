**nc-link-sink-plugin** is a NC-Link interface provider plugin for MTConnect Agents. The plugin runs a NC-Link server inside the agent to serve NC-Link clients according to NC-Link Specification.

MetaAgent configuration example using this NC-Link egress plugin:
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
  NC-LINK {
    Port = 1883

    # Sampling and upload interval (ms) for Samples, Events and Conditions - optional
    # Override defaultSampleInterval and defaultUploadInterval
    #
    SampleInterval_SAMPLE = 1000
    UploadInterval_SAMPLE = 3000
    SampleInterval_EVENT = 10000
    UploadInterval_EVENT = 30000
    SampleInterval_CONDITION = 10000
    UploadInterval_CONDITION = 30000

    # default intervals in milliseconds for any data types
    #
    # defaultSampleInterval = 10000
    # defaultUploadInterval = 60000

    #
    # mode can be agent or adapter, default is agent
    #
    # mode = agent

    #
    # Additional optional connection info
    # user =     <user's id>
    # password = <user's password>

    #
    # default useWebSocket is false
    # useWebSocket = <true or false>
    #

    #
    # connect info used by agent
    #
    # cert = <location of certificate file. Format: PEM>
    # key  = <location of key file. Format: PEM>

    #
    # connect info used by adapter
    # mqtt   = <mqtt server ip address>
    # cacert =  <location of cacert file. Format: PEM>
    #

    # licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file nc-link-sink.log
      level = info
    }
  }
}
```
