module Discovery
  class Question < ActiveRecord::Base
  	attr_accessible :question_type, :question, :option_1, :option_2, :personality_type, :option_1_value, :option_2_value

  	# def self.next_question
  	# 	if self.where(question_type: "self-guided")
  	# 		@start_self_guide = self.find(71)
  	# 		@next_question = @starts_self_guide.id + 1
  	# 		if @next_question == 75
  	# 			redirect_to quiz_path
  	# 		end
  	# 	elsif self.where(question_type: "quiz")
  	# 		# Logic for the next question for quiz questions go... 
  	# 	end
  	# end
  end
end
