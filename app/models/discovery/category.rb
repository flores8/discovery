module Discovery
  class Category < ActiveRecord::Base
  	attr_accessible :name, :personality_id

  	# Relationships
    belongs_to :personality
    has_many :strengths, dependent: :destroy
    has_many :personality_careers, dependent: :destroy
    has_many :personality_majors, dependent: :destroy
    
    # Validations
    validates :personality, presence: true
    validates :name, presence: true
  end
end
