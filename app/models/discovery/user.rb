class Discovery::User < User
	def progress
		(answers.count.to_f)/(Discovery::Question.all.count) * 100
	end
end