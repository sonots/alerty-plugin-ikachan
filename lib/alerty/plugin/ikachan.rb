require 'alerty'
require 'ikachan-client'

class Alerty
  class Plugin
    class Ikachan
      def initialize(config)
        raise ConfigError.new('ikachan: host is not configured') unless config.host
        raise ConfigError.new('ikachan: channel is not configured') unless config.channel
        host = config.host
        port = config.port || 4979
        unless (channel = config.channel).start_with?('#')
          channel = '#' << config.channel
        end
        num_retries = config.num_retries || 3

        @client = ::Ikachan::Client.new(host, port)
        @channel = channel
        @num_retries = num_retries
        @subject = config.subject
      end

      def alert(record)
        subject = expand_placeholder(@subject, record) if @subject
        message = record[:output]
        retries = 0
        begin
          @client.join(@channel)
          @client.privmsg(@channel, subject) if @subject
          message.split("\n").each do |line|
            @client.notice(@channel, line)
          end
          @client.leave(@channel)
        rescue => e
          retries += 1
          sleep 1
          if retries <= @num_retries
            retry
          else
            raise e
          end
        end
      end

      private

      def expand_placeholder(str, record)
        str.gsub('${hostname}', record[:hostname]).gsub!('${command}', record[:command])
      end
    end
  end
end
