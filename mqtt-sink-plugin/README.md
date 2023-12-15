MTConnect Agent provides an MQTT egress plugin to stream data from the agent to any MQTT server.

Here is an example for setting up the configuration:
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
  Mqtt2Service {

    # MQTT server connection info
    MqttHost = MQTTServer
    MqttPort = 1883
    MqttUserName = demo
    MqttPassword = testing
    MqttClientId = myDemo

    # Secured connection info
    # MqttCert = client.crt
    # MqttPrivateKey = client.key
    # MqttCaCert = ca-root-cert.crt
    # MqttTls = true

    # Topics
    # AssetTopic = <Topic for asset data>        Default is MTConnect/Asset/[device] 
    # ProbeTopic = <Topic for device model data> Default is MTConnect/Probe/[device]
    # CurrentTopic = <Topic for current data>.   Default is MTConnect/Current/[device]
    # SampleTopic = <Topic for new updates>.     Default is MTConnect/Sample/[device]
    # MqttLastWillTopic = <Topic for tracking agent's status>. Default is MTConnect/Probe/[device]/Availability

    # Publish Rates
    # MqttSampleInterval = <Sample public rate in ms>   Default is 500
    # MqttCurrentInterval = <Current public rate in ms> Default is 10000
    # MqttSampleCount = <Sample's buffer size>          Default is 1000
  }
}
```
