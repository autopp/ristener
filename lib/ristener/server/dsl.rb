module Ristener
  class Server
    # DSL for RistenFile
    #
    # @author autopp <autopp.inc@gmail.com>
    #
    class DSL
      def initialize
        @at_top_level = true
      end

      private

      def set(name, value)
        Server.conf[name] = value
      end

      def listen(command, &block)
        fail RistenerError, "cannot invoke `listen' except at top level." unless @at_top_level
        fail RistenerError, 'invalid command name' unless command =~ /[a-zA-Z_-]+/

        Router.add_route("#{command}") do
          @at_top_level = false
          block.call
        end
      end
    end
  end
end
