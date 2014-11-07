class Discovery::ApplicationController < ApplicationController
	rescue_from Pundit::NotAuthorizedError do |exception|
		redirect_to root_url, alert: exception.message
	end
end