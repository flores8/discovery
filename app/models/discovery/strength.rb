module Discovery
  class Strength < ActiveRecord::Base
    belongs_to :category
    attr_accessible :body
  end
end
