require "thor"
require "registry/client/config"

module Registry
  module Client

    class Cli < Thor
      include Thor::Actions
      
      default_task :help
      class_option :configfile,
        aliases: "-c",
        banner: "PATH",
        default: File.expand_path("config/registry.yml", Dir.pwd),
        desc: "Path to the configuration file."

    end

  end
end