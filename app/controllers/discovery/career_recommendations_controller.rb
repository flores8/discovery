require_dependency "discovery/application_controller"

module Discovery
	class CareerRecommendationsController < ApplicationController
		before_filter :authorize

		def create
      @category = Discovery::Category.find(params[:category_id])
      @career_recommendation = @category.career_recommendations.new(params[:career_recommendation])
			if @career_recommendation.save
				redirect_to category_path(@category), notice: 'The career recommendation was created successfully!'
			else
				redirect_to category_path(@category), alert: "Something went wrong. Please try again."
			end
		end

		def destroy
      @category = Discovery::Category.find(params[:id])
      @career_recommendation = Discovery::CareerRecommendation.find(params[:category_id])
      @career_recommendation.destroy
      redirect_to category_url(@category), notice: 'The career recommendation was deleted successfully.'
		end

		private

		def authorize
			unless current_user && current_user.role == "admin"
				redirect_to root_path, notice: "Sorry! You're not authorized to visit that page."
			end
		end
	end
end
