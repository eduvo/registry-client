module Registry
  module Client

    class Identity

      def initialize(conn)
        @conn = conn
      end

      def available?(email)
        @conn.get "who", email
      end

    end

  end
end
