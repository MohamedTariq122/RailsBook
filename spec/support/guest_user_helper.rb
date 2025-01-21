module GuestUserHelper
  def as_guest
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
  end
end

RSpec.configure do |config|
  config.include GuestUserHelper
end
