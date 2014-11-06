require_dependency "discovery/application_controller"

module Discovery
  class AnswersController < ApplicationController
  	before_filter :set_answer, only: [:show, :edit, :update, :destroy]
    before_filter :create_answer, only: [:create]
    before_filter :next_question, only: [:create, :edit, :update]
    before_filter :authenticate_user!

    # GET /answers
    def index
      @answers = Discovery::Answer.all
    end

    # GET /answers/1
    def show
      @answers = Discovery::Answer.new
    end

    # GET /answers/new
    def new
    end

    # GET /answers/1/edit
    def edit
    end

    def create
      @answer.user = current_user 
      @question = Discovery::Question.find(@answer.question)
      if @question.question_type == "self-guided"
        if @question.personality_type == "Extravert/Introvert"
          current_discovery_user.update_attribute :ei, @answer.value
        elsif @question.personality_type == "Sensory/Intuitive"
          current_discovery_user.update_attribute :si, @answer.value
        elsif @question.personality_type == "Thinking/Feeling"
          current_discovery_user.update_attribute :tf, @answer.value
        elsif @question.personality_type == "Judging/Perceiving"
          current_discovery_user.update_attribute :jp, @answer.value
        end
      end
      if @answer.save
      	if @next == 80 || @next == 75
      		redirect_to results_path
      	else
	        redirect_to controller: 'questions', action: 'show', id: @next
	      end
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /answers/1
    def update
      if @answer.update_attributes(params[:answer])
        @question = Discovery::Question.find(@answer.question)
        if @question.question_type == "self-guided"
          if @question.personality_type == "Extravert/Introvert"
            current_discovery_user.update_attribute :ei, @answer.value
          elsif @question.personality_type == "Sensory/Intuitive"
            current_discovery_user.update_attribute :si, @answer.value
          elsif @question.personality_type == "Thinking/Feeling"
            current_discovery_user.update_attribute :tf, @answer.value
          elsif @question.personality_type == "Judging/Perceiving"
            current_discovery_user.update_attribute :jp, @answer.value
          end
        end
        if @next == 80 || @next == 75
          redirect_to results_path
        else
          redirect_to controller: 'questions', action: 'show', id: @next
        end
      else
        render action: 'edit'
      end
    end

    # DELETE /answers/1
    def destroy
      @answer.destroy
      redirect_to :back, notice: 'Answer was successfully removed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_answer
        @answer = Discovery::Answer.find(params[:id])
      end

      def create_answer
        @answer = Discovery::Answer.new(params[:answer])
      end

      def next_question
        if @answer.question == 71 || @answer.question == 72 || @answer.question == 73 || @answer.question == 74
          @next = @answer.question + 1
        else
          @next = @answer.question + 10
          if @next > 70
            @next = @next - 69
          end
        end
      end

  end
end
