module Discovery
  class MajorRecommendation < ActiveRecord::Base
    attr_accessible :category_id, :major_id

    belongs_to :major
    belongs_to :category
  end
end
