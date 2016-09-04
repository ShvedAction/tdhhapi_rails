require 'test_helper'

class VacansiesControllerTest < ActionController::TestCase
  setup do
    @vacansy = vacansies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacansies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacansy" do
    assert_difference('Vacansy.count') do
      post :create, vacansy: { alternate_url: @vacansy.alternate_url, archived: @vacansy.archived, area_id: @vacansy.area_id, branded_description: @vacansy.branded_description, name: @vacansy.name, published_at: @vacansy.published_at, type_name: @vacansy.type_name }
    end

    assert_redirected_to vacansy_path(assigns(:vacansy))
  end

  test "should show vacansy" do
    get :show, id: @vacansy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacansy
    assert_response :success
  end

  test "should update vacansy" do
    patch :update, id: @vacansy, vacansy: { alternate_url: @vacansy.alternate_url, archived: @vacansy.archived, area_id: @vacansy.area_id, branded_description: @vacansy.branded_description, name: @vacansy.name, published_at: @vacansy.published_at, type_name: @vacansy.type_name }
    assert_redirected_to vacansy_path(assigns(:vacansy))
  end

  test "should destroy vacansy" do
    assert_difference('Vacansy.count', -1) do
      delete :destroy, id: @vacansy
    end

    assert_redirected_to vacansies_path
  end
end
