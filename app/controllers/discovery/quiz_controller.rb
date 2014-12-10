require_dependency "discovery/application_controller"

module Discovery
  class QuizController < ApplicationController
    before_filter :current_question, :next_question, only: [:show]
    before_filter :add_personality_type 
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
      
      # Introvert or Extravert?
      if @extravert > @introvert
        @ei = "extravert"
      else
        @ei = "introvert"
      end

      # Sensing or Intuitive?
      if @sensory > @intuitive
        @si = "sensing"
      else
        @si = "intuitive"
      end

      # Thinking or Feeling?
      if @thinking > @feeling
        @tf = "thinking"
      else
        @tf = "feeling"
      end

      # Judging or perceiving
      if @judging > @perceiving
        @jp = "judging"
      else
        @jp = "perceiving"
      end

    end

    def recommendations
      current_user.personality_type = @personality_type
      current_user.update_attribute(:personality_type, @personality_type)
    end

    def update

    end

    private
      def add_personality_type
        x = []
        x << current_user.ei.first.downcase
        if current_user.si == "Sensing"
          x << current_user.si.first.downcase
        elsif current_user.si == "Intuitive"
          x << current_user.si[1].downcase
        end
        x << current_user.tf.first.downcase
        x << current_user.jp.first.downcase
        @personality_type = x.join
      end
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
