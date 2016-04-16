module Discovery
  class Personality < ActiveRecord::Base
  	attr_accessible :name, :description

  	# Relationships
  	has_many :categories, dependent: :destroy
  	has_many :career_contentments, dependent: :destroy
    has_many :strengths, dependent: :destroy

  	# Validations
  	validates :name, presence: true
  	validates :description, presence: true
  end
end
