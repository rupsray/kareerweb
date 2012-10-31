require 'test_helper'

class AcademicsControllerTest < ActionController::TestCase
  setup do
    @academic = academics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academic" do
    assert_difference('Academic.count') do
      post :create, academic: { institute: @academic.institute, percentage: @academic.percentage, qualification: @academic.qualification, user_id: @academic.user_id, year_of_passout: @academic.year_of_passout }
    end

    assert_redirected_to academic_path(assigns(:academic))
  end

  test "should show academic" do
    get :show, id: @academic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @academic
    assert_response :success
  end

  test "should update academic" do
    put :update, id: @academic, academic: { institute: @academic.institute, percentage: @academic.percentage, qualification: @academic.qualification, user_id: @academic.user_id, year_of_passout: @academic.year_of_passout }
    assert_redirected_to academic_path(assigns(:academic))
  end

  test "should destroy academic" do
    assert_difference('Academic.count', -1) do
      delete :destroy, id: @academic
    end

    assert_redirected_to academics_path
  end
end
