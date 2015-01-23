module Discovery
  class Strength < ActiveRecord::Base
  	attr_accessible :body, :category_id

  	# Relationships
    belongs_to :category

    # Validations
    validates :body, presence: true
    validates :category_id, presence: true
    
  end
end
