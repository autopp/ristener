require 'sinatra/base'
require 'stringio'

module Ristener
  # Server side program
  #
  # @author autopp <autopp.inc@gmail.com>
  #
  class Server
    @conf = {}

    class << self
      # @return [Hash] configuration map
      attr_reader :conf

      # @return [StringIO]
      attr_reader :stderr_mock

      # @return [IO]
      attr_reader :stderr_orig

      def run(script_path)
        script = File.read(script_path)
        @stderr_mock = StringIO.new
        @stderr_orig = $stderr

        dsl = DSL.new
        dsl.instance_eval(script, script_path)

        Router.port = DEFAULT_PORT
        $stderr = @stderr_mock
        Router.run! do |server|
          case server
          when WEBrick::HTTPServer
            server.logger.level = WEBrick::BasicLog::WARN
          end
        end
      end
    end
  end
end

require 'ristener/server/router'
require 'ristener/server/dsl'
