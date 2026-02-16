**mtreplay** is a utility to replay the data captured from the MTConnect Adapters. 

Here is a mtreplay configuration example:
```
#
# Metalogi MTC Replayer configuraiton file
# info: https://wiki.metalogi.io
#
#=============================================
#
# server:
#  host: ::1  # defaults to :: (allows both IPv6 and IPv4 connections). Use host to bind to a single interface.
#  port: 7879 # defaults to: 7878

# Replays files matching a pattern in a directory. The patterns are normal file globbing patterns:
#    * - matches all characters
#    ? - matches a single character
#      - any other character matches that character literally    
replay:
  path: capture/*.txt # file pattern, all files in the directory using a standard globbing pattern
  max_interval: 200 # in ms. Allows for 
# fixed_interval: <interval in ms>

# Logging configuration using a rolling file logger. The current defaults place logging information into a log file
# in the same directory as the executable. The default rotation size (size when the log file is rolled into an archived
# timestamped file, is 10mb. The max log size is 100mb (10 x 10mb files). The file sizes can be set using suffixes, for 
# example, rotation_size: 1m will be 1048576 bytes. The extensions are as follows: k: kibibytes, m: mebibytes, and g: gibibytes.
#
# Allowed secerity levels are: trace, debug, info, warning, error, and fatal
logging:
  level: warning # default: info. 
# max_files: 10 # default 10
# rotation_size: 1mb # default 10mb. 
# file: <filename> # defaults to mtreplay.log
# archive_pattern: <_%Y-%m-%d_%H-%M-%S_%N> # pattern for filenaming when files are rotation. Default: _%Y-%m-%d_%H-%M-%S_%N
# max_size: <int> # maximum size of all the log files before they are removed
# max_files: <int> # the maximum number of files
# schedule: <value> # the schedule for file rotation DAILY, WEEKLY, or NEVER (default)
```
