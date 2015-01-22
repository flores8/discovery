module Discovery
  class Personality < ActiveRecord::Base
  	attr_accessible :name, :description
  	has_many :categories
  end
end
