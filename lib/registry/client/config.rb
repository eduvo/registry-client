require "yaml"
require "registry/client"

module Registry
  module Client
    module Config
      extend self

      def load(file)
        @_config ||= if File.exists? file
          YAML::load_file(file)
        else
          FileUtils.cp DEFAULT_CONFIG_FILE.gsub(/\.yml$/, '.default.yml'), DEFAULT_CONFIG_FILE
          YAML::load_file(DEFAULT_CONFIG_FILE)
        end
      end

    end
  end
end
