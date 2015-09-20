require 'net/http'
require 'uri'

module Ristener
  # Client program
  #
  # @author autopp <autopp.inc@gmail.com>
  #
  class Client
    def run(command, hostname, port)
      uri = URI.parse("http://#{hostname}:#{port}/#{command}")
      res = Net::HTTP.get_response(uri)

      case res
      when Net::HTTPSuccess
        true
      when Net::HTTPNotFound
        $stderr.puts "unknown command `#{command}'"
        false
      else
        $stderr.puts res.inspect
        false
      end
    end
  end
end
