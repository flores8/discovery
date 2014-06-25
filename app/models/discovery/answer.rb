module Discovery
  class Answer < ActiveRecord::Base
  	attr_accessible :value, :question
  end
end
