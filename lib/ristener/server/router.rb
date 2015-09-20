require 'sinatra/base'

module Ristener
  class Server
    # HTTP Router using Sinatra
    #
    # @author autopp <autopp.inc@gmail.com>
    #
    class Router < Sinatra::Base
      not_found do
        puts 'Not found'
        'Not found!!'
      end

      set :logging, false

      class << self
        public :run!

        def add_route(name, &block)
          get("/#{name}") do
            $stderr = Server.stderr_orig
            block.call
            $stderr = Server.stderr_mock
            $stderr.truncate(0)
            'Success'
          end
        end

        def bind(addr)
          set :bind, addr
        end
      end
    end
  end
end
