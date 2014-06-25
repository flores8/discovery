require 'test_helper'

module Discovery
  class QuizControllerTest < ActionController::TestCase
    test "should get new" do
      get :new
      assert_response :success
    end

  end
end
