require_dependency "discovery/application_controller"

module Discovery
  class AnswersController < ApplicationController
  	before_filter :set_answer, only: [:show, :edit, :update, :destroy]
    before_filter :next_question, only: [:create, :edit, :update]

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
      @answer = Discovery::Answer.new(params[:answer])
      @answer.user = current_user
      #binding.pry  
      if @answer.save
      	if @next == 70
      		redirect_to quiz_path
      	else
	        redirect_to controller: 'questions', action: 'show', id: @next
	      end
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /answers/1
    def update
      #binding.pry
      if @answer.update_attributes(params[:answer])
        if @next == 70
          redirect_to quiz_path
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
      redirect_to answers_url, notice: 'Answer was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_answer
        @answer = Discovery::Answer.find(params[:id])
      end

      def next_question
        @next = @answer.question + 10
        if @next > 70
          @next = @next - 69
        end
      end

  end
end
