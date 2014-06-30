require_dependency "discovery/application_controller"

module Discovery
  class AnswersController < ApplicationController
  	before_filter :set_answer, only: [:show, :edit, :update, :destroy]

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
      #@question = Discovery::Answer.new
    end

    # GET /answers/1/edit
    def edit
    end

    # POST /answers
    def create
    	# do some stuff
			# and then redirect_to Question#Show for next question
      @answer = Discovery::Answer.new(params[:answer])
      @answer.user = current_user
      @next_question = @answer.question + 10
      #binding.pry  
      if @next_question > 70
      	@next_question = @next_question - 69
      end
      
      if @answer.save
      	if @next_question == 70
      		redirect_to quiz_path
      	else
	        redirect_to controller: 'questions', action: 'show', id: @next_question
	      end
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /answers/1
    def update
      if @answer.update_attributes(params[:answer])
        redirect_to @answer, notice: 'Answer was successfully updated.'
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

  end
end
