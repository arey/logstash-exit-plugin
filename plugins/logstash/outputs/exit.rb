require 'logstash/outputs/base'
require 'logstash/program'

# Exit from Logstash.
#
# May be used to kill a logstash agent from a Logstash configuration file.
# Microsoft Windows user should appreciate.
# No configuration is required. The default exit code is 0 (normal exit).
# A pause could be add in order Logstah may flushes its last outputs.
# Example with a endfile "signal":
#   filter {  
#     if [message] =~ "^END FILE" {
#       mutate {
#         add_tag => ["endfile"]
#       }
#     }
#   }
#   output {
#     if "endfile" in [tags] {
#   	  exit {
#         pause_second => 30
#         exit_code => 1
#       }
#     } 
#   }
class LogStash::Outputs::Exit < LogStash::Outputs::Base
  config_name 'exit'  
  milestone 1

	config :pause_second, :validate => :number, :default => 0
	config :exit_code, :validate => :number, :default => 0
  
  public
  def register
    # nothing to do but must be overidden
  end # def register

	public
  def receive(event)
    return unless output?(event)
    # thread.raise(LogStash::ShutdownSignal)
    sleep @pause_second
		exit @exit_code
	end

end #class LogStash::Outputs::Exit
