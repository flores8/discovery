module Discovery
  class Personality < ActiveRecord::Base
  	attr_accessible :name, :description
  end
end
