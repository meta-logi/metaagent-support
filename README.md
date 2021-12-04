**MetaAgent** contains standard MTConnect Agent, additional **plugins**, **adapters** and **gateways** for OPC UA and NC-Link.

**Adapters** and **gateways** run as individual process and communicates with MTConnect to support OPC UA and NC-Link standard interface.
                                                                         
**Plugins** are dynamically loaded module for MTConnect and provide the same role as their respective adapters or gateways.
                    
For more details, please read their example configurations.

Note that all OPC UA and NC-Link modules function without license keys. But publish or process rate will be limited to once per minute and for outbound interfaces, only unsecured connections are allowed.
