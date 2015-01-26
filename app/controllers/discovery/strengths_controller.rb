require_dependency "discovery/application_controller"

module Discovery
	class StrengthsController < ApplicationController

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
				render category_path(@category)
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
	end
end