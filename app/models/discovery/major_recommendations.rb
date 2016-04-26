module Discovery
  class MajorRecommendations < ActiveRecord::Base
    attr_accessible :category_id, :major_id

    belongs_to :majors
    belongs_to :categories
  end
end
