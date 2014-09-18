require_dependency "discovery/application_controller"

module Discovery
  class QuestionsController < ApplicationController
    before_filter :set_question, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!

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
