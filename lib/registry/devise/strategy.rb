ENV['registry_secret'] = "1234678901234567890123456789012"

module Registry
  class Strategy < Devise::Strategies::Authenticatable

    def valid?
      return !!ENV['registry_secret']
    end

    def authenticate!
      klass = mapping.to
      if params[:token]
        token = Registry::Client::Crypto.decrypt(ENV['registry_secret'], params[:token])
        user = klass.find id
        if user
          registry_token, registry_created_at = user.registry_token.split(/\./)
          if token == registry_token
            if registry_created_at.to_i + 120 > Time.now.to_i
              success!(user)
            else
              fail!("Token expired.")
            end
          else
            fail!("Invalid token.")
          end
        else
          fail!("Unknown account.")
        end
      else
        fail!("No token provided.")
      end
    end

  private

    def challenge!
      response = Rack::Response.redirect("http//localhost", 300)
      custom! response.finish
    end

    def deny!
      body = %(This is an unauthorised request. Your IP address has been logged and will be reported.)
      response_headers = { 'Content-Type' => 'text/plain' }
      response = Rack::Response.new(body, 400, response_headers)
      custom! response.finish
    end

  end
end

Warden::Strategies.add :registry, Registry::Strategy
Devise.add_module :registry, :strategy => true
