require_dependency "discovery/application_controller"

module Discovery
	class StrengthsController < ApplicationController
		before_filter :authorize

		def edit
			@strength = Discovery::Strength.find(params[:category_id])
			@category = Discovery::Category.find(params[:id])
		end

		def create
			@category = Discovery::Category.find(params[:category_id])
			@strength = @category.strengths.new(params[:strength])
			if @strength.save
				redirect_to category_path(@category), notice: 'The strength was created successfully!'
			else
				redirect_to category_path(@category), alert: "Please include a strength first and then save it to this category."
			end
		end

		def update
			@category = Discovery::Category.find(params[:category_id])
			@strength = @category.strengths.find(params[:id])
			if @strength.update_attributes(params[:strength])
				redirect_to category_path(@category), notice: 'The strength was updated successfully!'
			else
				render action: 'edit'
			end
		end

		def destroy
			@category = Discovery::Category.find(params[:id])
			@strength = Discovery::Strength.find(params[:category_id])
			@strength.destroy
			redirect_to category_url(@category), notice: 'The strength was deleted successfully.'
		end

		private

		def authorize
			unless current_user && current_user.role == "admin"
				redirect_to root_path, notice: "Sorry! You're not authorized to visit that page."
			end
		end
	end
end
