module Discovery
  class Personality < ActiveRecord::Base
  	attr_accessible :name, :description

  	# Relationships
  	has_many :categories
  	has_many :career_contentments

  	# Validations
  	validates :name, presence: true
  	validates :description, presence: true
  end
end
