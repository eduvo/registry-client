require "registry/client/crypto"

module Registry
  module Client

    class Identity

      def initialize(config, conn)
        @conn = conn
        @config = config
      end

      def available?(email)
        payload = Registry::Client::Crypto.encrypt(@config['client']['secret_key'], email)
        #puts payload
        @conn.get "who", payload
      end

    end

  end
end
