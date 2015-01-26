module Discovery
  class CareerContentment < ActiveRecord::Base
  	attr_accessible :body, :personality_id

  	# Relationships
    belongs_to :personality

    # Validations
    validates :body, presence: true
    # validates :personality_id, presence: true
    
  end
end
