module Discovery
  class Category < ActiveRecord::Base
  	attr_accessible :name, :personality_id, :career_id, :major_ids

  	# Relationships
    belongs_to :personality
    has_many :major_recommendations
    has_many :majors, through: :major_recommendations
    has_many :career_recommendations
    has_many :careers, through: :career_recommendations
    has_many :strengths, dependent: :destroy

    # Validations
    validates :personality, presence: true
    validates :name, presence: true
  end
end
