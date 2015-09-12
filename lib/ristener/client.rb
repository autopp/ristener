require 'net/http'
require 'uri'

module Ristener
  # Client program
  #
  # @author autopp <autopp.inc@gmail.com>
  #
  class Client
    DEFAULT_HOSTNAME = 'localhost'
    def run(command, hostname = DEFAULT_HOSTNAME, port = DEFAULT_PORT)
      uri = URI.parse("http://#{hostname}:#{port}/#{command}")
      res = Net::HTTP.get_response(uri)
      p res unless res.success?
    end
  end
end
