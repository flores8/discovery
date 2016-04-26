module Discovery
  class Category < ActiveRecord::Base
  	attr_accessible :name, :personality_id, :career_id

  	# Relationships
    belongs_to :personality
    has_many :careers, dependent: :destroy
    has_many :majors, dependent: :destroy

    # Validations
    validates :personality, presence: true
    validates :name, presence: true
  end
end
