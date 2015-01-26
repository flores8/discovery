require_dependency "discovery/application_controller"

module Discovery
	class CareerContentmentsController < ApplicationController

		def new
			@contentment = Discovery::CareerContentment.new
		end

		def create
			@personality = Discovery::Personality.find(params[:personality_id])
			@contentment = @personality.career_contentments.new(params[:career_contentment])
			if @contentment.save
				redirect_to personality_path(@personality)
			else
				render personality_path(@personality)
			end
		end
	end
end