module Discovery
  class Answer < ActiveRecord::Base
  	attr_accessible :value, :question, :user_id
  	belongs_to :user
  end
end
