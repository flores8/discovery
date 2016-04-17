require_dependency "discovery/application_controller"

module Discovery
	class StrengthsController < ApplicationController
		before_filter :authorize

		def edit
			@strength = Discovery::Strength.find(params[:category_id])
			@personality = Discovery::Personality.find(params[:id]) # Check to make sure this is right
		end

		def create
			@personality = Discovery::Personality.find(params[:personality_id])
			@strength = @personality.strengths.new(params[:strength])
			if @strength.save
				redirect_to personality_path(@personality), notice: 'The strength was created successfully!'
			else
				redirect_to personality_path(@personality), alert: "Please include a strength first and then save it to this category."
			end
		end

		def update
			@personality = Discovery::Personality.find(params[:category_id])
			@strength = @personality.strengths.find(params[:id])
			if @strength.update_attributes(params[:strength])
				redirect_to personality_path(@personality), notice: 'The strength was updated successfully!'
			else
				render action: 'edit'
			end
		end

		def destroy
			@personality = Discovery::Personality.find(params[:id])
			@strength = Discovery::Strength.find(params[:personality_id])
			@strength.destroy
			redirect_to category_url(@personality), notice: 'The strength was deleted successfully.'
		end

		private

		def authorize
			unless current_user && current_user.role == "admin"
				redirect_to root_path, notice: "Sorry! You're not authorized to visit that page."
			end
		end
	end
end
