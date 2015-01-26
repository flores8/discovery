require_dependency "discovery/application_controller"

module Discovery
	class CareerContentmentsController < ApplicationController

		def create
			@personality = Discovery::Personality.find(params[:personality_id])
			@contentment = @personality.career_contentments.new(params[:career_contentment])
			if @contentment.save
				redirect_to personality_path(@personality)
			else
				render personality_path(@personality)
			end
		end

		def edit
			@personality = Discovery::Personality.find(params[:id])
			@contentment = Discovery::CareerContentment.find(params[:personality_id])
		end

		def update
			@personality = Discovery::Personality.find(params[:personality_id])
			@contentment = @personality.career_contentments.find(params[:id])
			if @contentment.update_attributes(params[:career_contentment])
				redirect_to personality_path(@personality), notice: 'The Career Contentment was updated successfully.'
			else
				render action: 'edit'
			end
		end

		def destroy
			@contentment = Discovery::CareerContentment.find(params[:personality_id])
			@contentment.destroy
			redirect_to personality_url, notice: 'The career contentment was successfully deleted.'
		end
	end
end