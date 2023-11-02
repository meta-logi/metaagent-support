**opcua-dataminer** is a OPC UA DataConnect Gateway process. It streams data from any OPC UA services to data services for RethinkDB, InfluxDB, ElasticSearch or Kafak.

Here is a opcua-dataminer configuration example that streams data from some devices in a OPC UA service to all four services:
```
# OPCUA Server information
OpcUAServer:
    name: d1
    url:  opc.tcp://demo.metalogi.io:4840/
    sampleInterval: 250
    namespaceFilter: ns=3

    #
    # applicationUri: <application name, for some OPC UA server, they may require it to match the client's certificate and/or the server's application name>
    #                 default is urn:open62541.server.application
    #
    # Additional optional connection info
    # cert:     <location of the certificate file. Format: DER>
    # key:      <location of the key file. Format: PEM>
    # user:     <user's id>
    # password: <user's password>
    #
    # certificateCheck: [true, false]
    #                   default is false
    #
    # messageSecurityMode: [None, sign, sign&encrypt]
    # securityPolicy: [None, Basic128Rsa15, Basic256, Basic256Sha256, Aes128_Sha256_RsaOaep]
    #
    # messageSecurityMode and SecurityPolicy are only required if the server does not provide discovery service
    #

    # =================== RethinkDB Defaults ==========================
    # 
    # this section should be removed if RethinkDB is not required
    #
    RethinkDBServer: localhost:28015
    #RethinkDBAuthKey: <your authKey if needed>
    RethinkDBDatabase: testing          # default is mtconnect
    RethinkDBNodeTreeTable: sourceinfo  # default is none (disabled)
    RethinkDBDataTable: mtdata          # default is mtdata
    RethinkDBQueueSize: 20000           # default is 10000, max # of queue items.
    RethinkDBBatchSize: 100             # default is 200, number of records to be processed together

    # =================== InfluxDB Defaults ==========================
    # 
    # this section should be removed if InfluxDB is not required
    #
    InfluxDBUrl: http://localhost:8086
    InfluxDBOrganization: YourOrganization # InfluxDB Organization where the bucket is located
    InfluxDBBucket: YourBucket             # InfluxDB Bucket
    #InfluxDBAuthKey: <your authKey if needed>
    InfluxDBOrganization: testing
    InfluxDBQueueSize: 20000               # default is 10000, max # of queue items.
    InfluxDBBatchSize: 100                 # default is 200, number of records to be processed together
 
    # =================== ElasticSearch Defaults ==========================
    # 
    # this section should be removed if ElasticSearch is not required
    #
    ElasticSearchUrl: http://localhost:9200
    ElasticSearchUser: YourUserId
    ElasticSearchPassword: YourPassword
    ElasticSearchIndexName: mtconnect   # default is mtconnect, Index name associated with the data.
    ElasticSearchQueueSize: 20000       # default is 10000, max # of queue items.
    ElasticSearchBatchSize: 100         # default is 200, number of records to be processed together


    # =================== Kafka Defaults ==========================
    # 
    # this section should be removed if Kafka is not required
    #
    KafkaBrokers: localhost:9092
    KafkaTopicDeviceNodeTree: MTConnect.NewDeviceNodeTree   # default is none (disabled)
    KafkaTopicDeviceData: MTConnect.NewDeviceData           # default is MTConnect.DeviceData
    KafkaQueueSize: 20000                                   # default is 10000, max # of queue items.
    KafkaBatchSize: 100                                     # default is 200, number of records to be processed together

    # license
    #licenseKey: <your Metalogi license key>


# serverity can be debug, info, warn, error or off
logging:
    severity: info
    messageOnly: false


```
