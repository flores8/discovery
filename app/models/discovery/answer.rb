module Discovery
  class Answer < ActiveRecord::Base
  	attr_accessible :value, :question
  	belongs_to :user
  end
end
