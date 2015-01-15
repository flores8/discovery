require_dependency "discovery/application_controller"

module Discovery
  class QuizController < ApplicationController
    before_filter :authenticate_user!
    before_filter :current_question, :next_question, only: [:show]
    before_filter :add_personality_type 

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
      if (@extravert - @introvert) > 2
        @ei = "Extravert"
      elsif (@introvert - @extravert) > 2
        @ei = "Introvert"
      else 
        @ei = nil
      end

      # Sensing or Intuitive?
      # make sure there is enough of a difference
      # before assigning - in this case 3 point difference
      if (@sensory - @intuitive) > 3
        @si = "Sensory"
      elsif (@intuitive - @sensory) > 3
        @si = "Intuitive"
      else
        @si = nil
      end

      # Thinking or Feeling?
      if (@thinking - @feeling) > 3
        @tf = "Thinking"
      elsif (@feeling - @thinking) > 3
        @tf = "Feeling"
      else 
        @tf = nil
      end

      # Judging or perceiving
      if (@judging - @perceiving) > 3
        @jp = "Judging"
      elsif (@perceiving - @judging) > 3
        @jp = "Perceiving"
      else
        @jp = nil
      end

      current_discovery_user.update_attribute(:ei, @ei)
      current_discovery_user.update_attribute(:si, @si)
      current_discovery_user.update_attribute(:tf, @tf)
      current_discovery_user.update_attribute(:jp, @jp)

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
        if current_discovery_user.progress > 25
          x << current_user.ei.first.downcase
          if current_user.si == "Intuitive"
            x << current_user.si[1].downcase
          else
            x << current_user.si[0].downcase
          end
          x << current_user.tf.first.downcase
          x << current_user.jp.first.downcase
          @personality_type = x.join
        end
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
