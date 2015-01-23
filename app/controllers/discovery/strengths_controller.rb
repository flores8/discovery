require_dependency "discovery/application_controller"

module Discovery
	class StrengthsController < ApplicationController
		before_filter :set_strength, only: [:show, :edit, :update, :destroy]

		def index
			@strengths = Discovery::Strength.all
		end

		def show
		end

		def new
			@strength = Discovery::Strength.new
		end

		def edit
		end

		def create
			@strength = Discovery::Strength.new(params[:strength])
			if @strength.save
				redirect_to @strength, notice: 'The strength was created successfully!'
			else
				render action: 'edit'
			end
		end

		def update
			if @strength.update_attributes(params[:strength])
				redirect_to @strength, notice: 'the strength was updated successfully!'
			else
				render action: 'edit'
			end
		end

		def destroy
			@strength.destroy
			redirect_to strengths_url, notice: 'The strength was deleted successfully.'
		end

		private

		def set_strength
			@strength = Discovery::Strength.find(params[:id])
		end
	end
end