module Discovery
  class Personality < ActiveRecord::Base
  	attr_accessible :name, :description

  	# Relationships
  	has_many :categories
  	has_many :career_contentments
  end
end
