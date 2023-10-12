**QIF-adapter-plugin** is a QIF data feed plugin for MTConnet Agents.  The plugin scans QIF files and publishs their contents under MTConnect ASSET category.

Here is a MTConnect agent configuration example using this QIF data feed plugin:
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

  QIF_ADAPTER:QIF
  {
    # location  = <QIF file location>            - default is current directory
    # pattern   = <regex file pattern>           - default is all
    # timeDelay = <delay processing in seconds>  - default is 0
    location = /QIF/location
    pattern = .*\.qif
    timeDelay = 2

    # licenseKey = <your license key - default is demo mode if not provided>
    # under demo mode, scan interval is 1 minute and only 20 QIF files will be processed

    # option to override logger config for this adapter
    logger_config {
      output = file qif.log
      level = info
    }
  }
}

logger_config {
  output = file agent.log
  level = info
}
```
