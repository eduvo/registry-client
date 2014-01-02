require "faraday"

module Registry
  module Client

    class Connection

      def initialize(params)
        @params = params
        @conn = Faraday.new "https://#{@params['server']['host']}:#{@params['server']['port']}",
          :ssl => {
            ## will need proper config
            :verify => false
          }
      end

      def ping
        get 'ping'
      end

      def get(path,payload=nil)
        query = {
          i: @params['client']['public_key'],
          r: "http://localhost"
        }
        query[:p] = payload if payload
        response = @conn.get "#{path}", query
        response.body
      rescue Exception => e
        e.message
      end

    end

  end
end
