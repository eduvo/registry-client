require "faraday"

module Registry
  module Client
    
    class Connection

      def initialize(params)
        @conn = Faraday.new "https://#{params['host']}:#{params['port']}",
          :ssl => {
            :verify => false
          }
      end

      def ping
        begin
          response = @conn.get '/ping'
          response.body
        rescue Exception => e
          e.message
        end
      end

    end

  end
end
