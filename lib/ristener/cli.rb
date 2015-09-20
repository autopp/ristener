require 'thor'

module Ristener
  # Command line interface of the Ristener
  #
  # @author autopp <autopp.inc@gmail.com>
  #
  class CLI < Thor
    option :ristenfile, aliases: :f, type: :string, default: './RistenFile'
    desc 'server', 'Run as server mode'
    def server
      Server.run(options[:ristenfile])
    end

    option :host, aliases: :H, type: :string, default: 'localhost'
    option :port, aliases: :p, type: :numeric, default: DEFAULT_PORT
    desc 'client COMMAND', 'Run as client mode'
    def client(command)
      Client.new.run(command, options[:host], options[:port])
    end
  end
end
