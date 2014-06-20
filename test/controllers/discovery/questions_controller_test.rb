require 'test_helper'

module Discovery
  class QuestionsControllerTest < ActionController::TestCase
    setup do
      @question = questions(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:questions)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create question" do
      assert_difference('Question.count') do
        post :create, question: { option_1: @question.option_1, option_1_value: @question.option_1_value, option_2: @question.option_2, option_2_value: @question.option_2_value, personality_type: @question.personality_type, question: @question.question }
      end

      assert_redirected_to question_path(assigns(:question))
    end

    test "should show question" do
      get :show, id: @question
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @question
      assert_response :success
    end

    test "should update question" do
      patch :update, id: @question, question: { option_1: @question.option_1, option_1_value: @question.option_1_value, option_2: @question.option_2, option_2_value: @question.option_2_value, personality_type: @question.personality_type, question: @question.question }
      assert_redirected_to question_path(assigns(:question))
    end

    test "should destroy question" do
      assert_difference('Question.count', -1) do
        delete :destroy, id: @question
      end

      assert_redirected_to questions_path
    end
  end
end
