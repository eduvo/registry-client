require "thor"
require "registry/client"
require "registry/client/config"
require "registry/client/connection"
require "registry/client/identity"

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
        puts conn.ping
      end

      desc "available EMAIL", "checks if an email is available"
      def available(email)
        identity = Registry::Client::Identity.new(config, conn)
        puts identity.available?(email)
      end

      no_commands do
        def config
          @_config ||= Registry::Client::Config.load(options[:configfile])
        end
        def conn
          @_conn ||= Registry::Client::Connection.new(config)
        end
      end

    end

  end
end
