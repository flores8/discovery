module Discovery
  class Category < ActiveRecord::Base
  	attr_accessible :name, :personality_id

  	# Relationships
    belongs_to :personality
    has_many :strengths
    has_many :personality_careers
    has_many :personality_majors
    
    # Validations
    validates :personality, presence: true
    validates :name, presence: true
  end
end
