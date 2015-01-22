module Discovery
  class Category < ActiveRecord::Base
    belongs_to :personality
    attr_accessible :name, :personality_id

    validates :personality, presence: true
    validates :name, presence: true
  end
end
