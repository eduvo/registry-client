require "faraday"

module Registry
  module Client
    
    class Connection

      def initialize(params)
        @conn = Faraday.new "https://#{params['host']}:#{params['port']}",
          :ssl => {
            ## will need proper config
            :verify => false
          }
      end

      def ping
        response = @conn.get '/ping'
        response.body
      rescue Exception => e
        e.message
      end

    end

  end
end
