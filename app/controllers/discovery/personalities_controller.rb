require_dependency "discovery/application_controller"

module Discovery
	class PersonalitiesController < ApplicationController
		before_filter :set_personality, only: [:show, :edit, :update, :destroy]

		def index
			@personalities = Discovery::Personality.all
		end

		def show
			@personality = Discovery::Personality.find(params[:id])
		end

		def new
			@personality = Discovery::Personality.new
		end

		def edit
		end

		def create
			@personality = Discovery::Personality.new(params[:personality])
			if @personality.save
				redirect_to @personality, notice: 'The personality was created successfully!'
			else
				render action: 'edit'
			end
		end

		def update
			if @personality.update_attributes(params[:personality])
				redirect_to @personality, notice: 'The personality was updated successfully!'
			else
				render action: 'edit'
			end
		end

		def destroy
			@personality.destroy
			redirect_to personalities_url, notice: "The personality was deleted successfully."
		end

		private
		def set_personality
			@personality = Discovery::Personality.find(params[:id])
		end
	end
end
