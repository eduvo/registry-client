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

      def get(path,payload=nil,returnurl=nil)
        query = {
          i: @params['client']['public_key'],
          # TODO: set domain from aplication scope
          d: "testdomain"
        }
        query[:p] = payload if payload
        query[:r] = returnurl if returnurl
        response = @conn.get "#{path}", query
        response.body
      rescue Exception => e
        e.message
      end

    end

  end
end
