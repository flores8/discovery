require_dependency "discovery/application_controller"

module Discovery
  class QuestionsController < ApplicationController
    before_filter :set_question, only: [:show, :edit, :update, :destroy]

    # GET /questions
    def index
      @questions = Discovery::Question.all
    end

    # GET /questions/1
    def show
      #binding.pry
      # this might belong in the view...
      # if current_user.answers.where(question: @question.id)
      #   puts "already answered!"
      #   @answer = current_user.answers.where(question: @question.id)
      # else
      #   @answer = Discovery::Answer.new
      #   @answer.question = @question.id
      # end
      @progress = current_user.answers.count
      @progress_relative = (@progress.to_f)/(Discovery::Question.all.count)
      @total = @progress_relative * 100
      @answer = Discovery::Answer.new
      @answer.question = @question.id
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
