Warden::Strategies.add(:registry_strategy) do
  def valid?
    # code here to check whether to try and authenticate using this strategy;
    return true
  end

  def authenticate!
    # code here for doing authentication;
    # if successful, call
    #success!(resource) # where resource is the whatever you've authenticated, e.g. user;
    # if fail, call
    fail!("failed") # where message is the failure message
  end
end

Devise.setup do |config|
  config.warden do |manager|
     manager.default_strategies.unshift :registry_strategy
  end
end

puts "included ------------------------------------"
