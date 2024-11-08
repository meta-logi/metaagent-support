**file-capture-sink-plugin** is a Data Capture egress plugin for MTConnet Agents. The plugin streams observation and asset data from the agent to a file location. The output files are Asset-YYYY-MM-DD.txt and <deviceId>-Observation-YYYY-MM-DD.txt. It supports both JSON and delimiter-separated text file formats.

Here is a MTConnect agent configuration example using this FileCapture egress plugin:
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
  FileCapture {

    #
    # outputLocation = <the location of the output file - default is MTConnectData>
    #                  if relative path is specified, it is relative to the working directory
    # 
    # fileFormat = <json or text - default is text>
    #
    outputLocation = MTDataHistory

    # licenseKey = <your license key - default is demo mode if not provided>

    # override logger config 
    logger_config {
      output = file file-capture-sink.log
      level = info
    }
  }
}
```
