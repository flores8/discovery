module Discovery
  class Strength < ActiveRecord::Base
  	attr_accessible :body, :category_id

  	# Relationships
    belongs_to :personality

    # Validations
    validates :body, presence: true
    validates :personality_id, presence: true

  end
end
