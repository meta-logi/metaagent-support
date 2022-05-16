**MetaAgent** contains standard MTConnect Agent, additional **plugins**, **adapters** and **gateways** for OPC UA and NC-Linkx.

Additionally, MetaAgent also provides a number of real-time or time series database sink plugins: RethinkDB, InfluxDB, ElasticSearch and Kafka. They provide data streaming services for the MetaAgent and let you capture the data for analysis.

**Adapters** and **gateways** run as individual process and communicates with MTConnect to support OPC UA and NC-Link standard interface.
                                                                         
**Plugins** are dynamically loaded module for MTConnect and provide the same role as their respective adapters or gateways.
                    
For more details, please read their example configurations.

Please check out https://github.com/meta-logi/metaagent-support for latest updates.

**Note that all modules function without license keys.** For OPC UA and NC-Link modules, publish or process rate will be limited to once per minute and for outbound interfaces, only unsecured connections are allowed. For other modules, each data item will only get updated every 20 seconds.
