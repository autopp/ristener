require 'sinatra/base'

module Ristener
  # Server side program
  #
  # @author autopp <autopp.inc@gmail.com>
  #
  class Server
    class << self
      def run(script_path = './RistenFile', port = DEFAULT_PORT)
        script = File.read(script_path)

        dsl = DSL.new
        dsl.instance_eval(script, script_path)

        Router.port = port
        Router.run!
      end
    end
  end
end

require 'ristener/server/router'
require 'ristener/server/dsl'
