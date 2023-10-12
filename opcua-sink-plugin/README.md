**opcua-sink-plugin** is an OPC UA interface provider plugin for MTConnect Agents.  The plugin runs a OPC UA server in the agent to serve OPC UA clients according to MTConnect OPC UA Companion Specification.

Here is a MTConnect agent configuration example using this OPC UA egress plugin:
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
  OPCUA:OPCUA {
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
    # cert =     <location of the certificate file. Format: DER>
    # key =      <location of the key file. Format: PEM>
    # user =     <user's id>
    # password = <user's password>
    # certificateCheck = [true, false] 
    #                    default is false
    # allowSecurityPolicyNone = [true, false]
    #                    default is false
    #

    # licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file opcua-sink.log
      level = info
    }
  }
}
```
