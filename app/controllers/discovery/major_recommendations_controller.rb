require_dependency "discovery/application_controller"

module Discovery
	class MajorRecommendationsController < ApplicationController
		before_filter :authorize

		def create
      @category = Discovery::Category.find(params[:category_id])
      @major_recommendation = @category.major_recommendations.new(params[:major_recommendation])
			if @major_recommendation.save
				redirect_to category_path(@category), notice: 'The major recommendation was created successfully!'
			else
				redirect_to category_path(@category), alert: "Something went wrong. Please try again."
			end
		end

		def destroy
      @category = Discovery::Category.find(params[:id])
      @major_recommendation = Discovery::MajorRecommendation.find(params[:category_id])
      @major_recommendation.destroy
      redirect_to category_url(@category), notice: 'The major recommendation was deleted successfully.'
		end

		private

		def authorize
			unless current_user && current_user.role == "admin"
				redirect_to root_path, notice: "Sorry! You're not authorized to visit that page."
			end
		end
	end
end
