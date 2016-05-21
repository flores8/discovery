module Discovery
  class CareerRecommendation < ActiveRecord::Base
    attr_accessible :category_id, :career_id

    belongs_to :career
    belongs_to :category

    validates :career_id, presence: true
  end
end
