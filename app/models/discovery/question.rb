module Discovery
  class Question < ActiveRecord::Base
  	attr_accessible :question, :option_1, :option_2, :personality_type, :option_1_value, :option_2_value
  end
end
