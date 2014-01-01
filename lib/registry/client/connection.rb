require "faraday"

module Registry
  module Client
    
    class Connection

      def initialize(params)
        conn = Faraday.new "https://#{params['host']}:#{params['port']}",
          :ssl => {
            :verify => false
          }
        begin
          response = conn.get '/ping'
          puts response.body
        rescue Exception => e
          puts e.message
        end
      end

    end

  end
end
