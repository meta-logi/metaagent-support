**transform-plugin** is data translation plugin for MTConnect Agents. Data mapping rules can be specified in the agent.cfg. The plugin will translate or create the data based on these rules. 

Here is a MTConnect agent configuration example using this Transform plugin:
```
Devices = _metaagent_.xml
Port = 7979

Plugins {
  transform {
    rules {
      x:PROCESS_ACTIVITY {
        1:DOWNTIME = "CONTROLLER_MODE != 'AUTOMATIC' or EXECUTION != 'ACTIVE'"
        2:RAPID = "PATH_FEEDRATE >= 150.0"
        3:ACTIVE = "B::ANGULAR_VELOCITY > 300.0 and PATH_FEEDRATE > 2.0 and PATH_FEEDRATE < 150.0 and B::LOAD > 0.0"
        4:IDLE = "true"
      }
      x:PROCESS_MATERIAL_BOUNDS {
        1:IN = "x:PROCESS_ACTIVITY = 'ACTIVE' and PATH_POSITION[Z] <= 0.0"
        2:OUT = "true"
      }
    }

    # licenseKey = <your license key - default is demo mode if not provided, only one rule is executed>

    # override logger config 
    logger_config {
      output = file transform.log
      level = info
    }
  }
}


Adapters
{
  Mazak
  {
    Host = demo.metalogi.io
    Port = 7879
  }
}

```
