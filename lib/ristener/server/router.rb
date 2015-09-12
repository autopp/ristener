require 'sinatra/base'

module Ristener
  class Server
    # HTTP Router using Sinatra
    #
    # @author autopp <autopp.inc@gmail.com>
    #
    class Router < Sinatra::Base
      class << self
        public :run!

        def add_route(name, &block)
          get("/#{name}") do
            block.call
            'ok'
          end
        end
      end
    end
  end
end
