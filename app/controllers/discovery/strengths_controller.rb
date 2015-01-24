require_dependency "discovery/application_controller"

module Discovery
	class StrengthsController < ApplicationController
		before_filter :set_category, only: [:edit]
		before_filter :set_category_strength, only: [:edit]
		before_filter :set_strength, only: [:update, :destroy]

		def new
			@strength = Discovery::Strength.new
		end

		def edit
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
			@strength.destroy
			redirect_to strengths_url, notice: 'The strength was deleted successfully.'
		end

		private

		def set_category
			@category = Discovery::Category.find(params[:id])
		end

		def set_category_strength
			@strength = @category.strengths.find(params[:category_id])
		end

		def set_strength
			@strength = Discovery::Strength.find(params[:id])
		end
	end
end