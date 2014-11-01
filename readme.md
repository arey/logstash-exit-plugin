# LogStash Exit Plugin #

The exit plugin stops the LogStash agent.

## Quick install ##

git clone git://github.com/arey/logstash-exit-plugin.git

cd logstash-exit-plugin

set LOGSTASH_HOME=<your logstash installation directory>

%LOGSTASH_HOME%\bin\logstash agent --pluginpath .\plugins -f exit-example.conf

## Documentation ##

Stop a LogStash agent from a LogStash configuration file.

This plugin is usefull for testing or batch.

No configuration is required. The default exit code is 0 (normal exit).

A pause could be add in order LogStash may flushes its last outputs.

To stop a LogStash agent, one option would be to put a line at the end of the log such as:

END FILE

You can then use the exit plugin which is executed by LogStash when it hits that line.

The exit-example.conf configuration file provides an example.

Here an overview:
```
exit {
  pause_second => 10
  exit_code => 99
}
```
