**nc-link-adapter** is a MTConnect adapter process to collect data from NC-Link servers and provide the stream updates for MTConnect Agent according to the requirements of MTConnect specification. 

Usage:
```
nc-link-adapter [config file - default is nc-link-adapter.cfg]
```

Configuration Example:
```
# devices
devices:
    #
    # - name:           <device name>
    #   uuid:           <NC-Link device id>
    - name: NL_Demo
      uuid: 189FFDD66F369F1

# NC-Link MQTT Agent information
NC-Link_Server:
    mqtt: 27.17.57.163
    port: 1883

    #
    # Additional optional connection info
    # user:     <user's id>
    # password: <user's password>
    # cacert:   <location of cacert file>

    #
    # default useWebSocket is false
    # useWebSocket: <true or false>
    #

server:
    port: 7878

logging:
    # serverity can be debug, info, warn, error or off, default is info
    severity: info
```
