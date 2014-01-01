require "thor"
require "registry/client"
require "registry/client/config"
require "registry/client/connection"

module Registry
  module Client

    class Cli < Thor
      include Thor::Actions
      
      default_task :help
      class_option :configfile,
        aliases: "-c",
        banner: "PATH",
        default: DEFAULT_CONFIG_FILE,
        desc: "Path to the configuration file."

      desc "ping", "ping to see if Registry server is reachable"
      def ping
        config = Registry::Client::Config.load(options[:configfile])
        conn = Registry::Client::Connection.new(config['server'])
      end

    end

  end
end