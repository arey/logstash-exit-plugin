echo Begin exit plugin example
if .%LOGSTASH_HOME% == . set LOGSTASH_HOME=C:\Software\Dev\logstash-1.4.2-swisslife
call %LOGSTASH_HOME%\bin\logstash agent --pluginpath .\plugins -f exit-example.conf
echo End exit plugin example