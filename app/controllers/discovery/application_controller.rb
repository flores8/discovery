module Discovery
  class ApplicationController < ActionController::Base
  	helper_method :current_discovery_user

  	def current_discovery_user
  		Discovery::User.find(current_user.id)
  	end
  end
end
