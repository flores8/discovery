require_dependency "discovery/application_controller"

module Discovery
  class QuizController < ApplicationController
    before_filter :current_question, :next_question, only: [:show]
    before_filter :authenticate_user!
    def new
    end

    def show 
    	@extravert = Discovery::Answer.where(user_id: current_user.id).where(value: "Extravert").count
    	@introvert = Discovery::Answer.where(user_id: current_user.id).where(value: "Introvert").count
    	@sensory = Discovery::Answer.where(user_id: current_user.id).where(value: "Sensory").count
    	@intuitive = Discovery::Answer.where(user_id: current_user.id).where(value: "Intuitive").count
    	@thinking = Discovery::Answer.where(user_id: current_user.id).where(value: "Thinking").count
    	@feeling = Discovery::Answer.where(user_id: current_user.id).where(value: "Feeling").count
    	@judging = Discovery::Answer.where(user_id: current_user.id).where(value: "Judging").count
    	@perceiving = Discovery::Answer.where(user_id: current_user.id).where(value: "Perceiving").count
    end

    def recommendations
    end

    private
      # If you've answered some questions let's find out what question you're on.
      def current_question
        if current_user && current_user.answers.present?
          @n = 1
          while current_user.answers.where(id: @n).present?
            @n += 1
          end
          @last_answered = current_user.answers.last
          @last_question = Discovery::Question.find(@last_answered.question)
        end
      end

      def next_question
        if current_user && current_user.answers.present?
          @next_question = @last_question.id + 10
          if @next_question > 70
            @next_question = @next_question - 69
          end
        end
      end
  end
end
