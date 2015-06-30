require_dependency "discovery/application_controller"

module Discovery
	class CategoriesController < ApplicationController
		before_filter :set_category, only: [:show, :edit, :update, :destroy]

		def index
			@categories = Discovery::Category.all
			@personalities = Discovery::Personality.all
		end

		def show
			# binding.pry
			@strengths = @category.strengths
			# @strength = @category.strengths.new
			@career_recommendations = @category.personality_careers
			@careers = Career.all
		end

		def new
			@category = Discovery::Category.new
		end

		def edit
		end

		def create
			@category = Discovery::Category.new(params[:category])
			if @category.save
				redirect_to @category, notice: 'The category was created successfully!'
			else
				render action: 'edit'
			end
		end

		def update
			if @category.update_attributes(params[:category])
				redirect_to @category, notice: 'The category was updated successfully!'
			else
				render action: 'edit'
			end
		end

		def destroy
			@category.destroy
			redirect_to categories_url, notice: 'The category was deleted successfully.'
		end


		private

		def set_category
			@category = Discovery::Category.find(params[:id])
		end
	end
end