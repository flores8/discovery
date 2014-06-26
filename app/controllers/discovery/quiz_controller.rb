require_dependency "discovery/application_controller"

module Discovery
  class QuizController < ApplicationController
    def new
    	# you might not need much logic here
    end

    def show 
    	@extravert = Discovery::Answer.where(value: "Extravert").count
    	@introvert = Discovery::Answer.where(value: "Introvert").count
    	@sensory = Discovery::Answer.where(value: "Sensory").count
    	@intuitive = Discovery::Answer.where(value: "Intuitive").count
    	@thinking = Discovery::Answer.where(value: "Thinking").count
    	@feeling = Discovery::Answer.where(value: "Feeling").count
    	@judging = Discovery::Answer.where(value: "Judging").count
    	@perceiving = Discovery::Answer.where(value: "Perceiving").count

    	#displays personality and percentage complete
    end
  end
end
