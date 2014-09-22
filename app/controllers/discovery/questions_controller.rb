require_dependency "discovery/application_controller"

module Discovery
  class QuestionsController < ApplicationController
    before_filter :set_question, only: [:show, :edit, :update, :destroy]
    before_filter :current_question, :next_question, only: [:index, :show]
    before_filter :previous_question, only: [:show]
    before_filter :authenticate_user!
    # binding.pry

    # GET /questions
    def index
      @questions = Discovery::Question.all
    end

    def show

      if answer_update = current_user.answers.find_by_question(Discovery::Question.find(params[:id]))
        @answer = answer_update
      else
        @answer = Discovery::Answer.new
        @answer.question = @question.id
        @answer.user_id = current_user.id
      end
      
      
    end

    # GET /questions/new
    def new
      @question = Discovery::Question.new 
    end

    # GET /questions/1/edit
    def edit
    end

    # POST /questions
    def create
      @question = Discovery::Question.new(params[:question])

      if @question.save
        redirect_to @question, notice: 'Question was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /questions/1
    def update
      if @question.update_attributes(params[:question])
        redirect_to @question, notice: 'Question was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /questions/1
    def destroy
      @question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
    end

    private
      # If you've answered some questions let's find out what question you're on.
      def current_question 
        @n = 1
        while current_user.answers.where(id: @n).present?
          @n += 1
        end
        @last_answered = current_user.answers.last
        @last_question = Discovery::Question.find(@last_answered.question)
      end

      def next_question
        @next_question = @last_question.id + 10
        if @next_question > 70
          @next_question = @next_question - 69
        end
      end

      def previous_question
        @previous_question = @question.id - 10
        if @previous_question < 0
          @previous_question = @previous_question + 69
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_question
        @question = Discovery::Question.find(params[:id])
      end

      # def percentage_complete
      #   @progress = current_user.answers.count
      #   @total = @progress/(Discovery::Question.all.count)
      # end
  end
end
