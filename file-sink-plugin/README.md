**file-sink-plugin** is a File-based egress plugin for MTConnet Agents. The plugin streams data from the agent to a file location. The output files are Asset-YYYY-MM-DD.txt and Observation-YYYY-MM-DD.txt. If it supports both json or delimiter separated text file format.

Here is a MTConnect agent configuration example using this File egress plugin:
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
  FILE {

    # outputLocation = <the location of the output file - default is MTConnectData>
    # fileFormat = <json or text - default is text>
    outputLocation = "MTDataHistory"

    # licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file file-sink.log
      level = info
    }
  }
}
```
