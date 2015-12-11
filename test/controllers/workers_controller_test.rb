require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  setup do
    @worker = workers(:John)
  end

  test "should get index" do
    get :index , :format => 'js'
    assert_response :success
    assert_not_nil assigns(:workers)
  end

  test "should get new" do
    get :new , :format => 'js'
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post :create,:format => 'js', worker: { first_name: 'Jack', last_name: 'Parker' }
    end
  end

  test "should not create worker" do
    assert_no_difference('Worker.count') do
    post :create, :format => 'js', worker: { :first_name => nil }
    end
    assert assigns(:worker).errors.any?
   end

  test "should show worker" do
    get :show, :format => 'js', id: @worker
    assert_response :success
  end
  
  test "should hide worker" do
    get :hide, :format => 'js', id: @worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, :format => 'js', id: @worker
    assert_response :success
  end

  test "should update worker" do
    patch :update, :format => 'js', id: @worker, worker: { first_name: @worker.first_name, last_name: @worker.last_name }
    assert_response :success
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
	  @new_worker = workers(:David)
      delete :destroy, :format => 'js', id: @new_worker
    end
    assert_response :success
  end
  
  test "should not destroy worker if work order assigned" do
	assert_no_difference('Worker.count') do	  
      delete :destroy, :format => 'js' , id: @worker
    end
    assert_response :success
  end
  
  
  test "should not update worker" do
    patch :update, :format => 'js', id: @worker, worker: { :first_name => '123', :last_name => '456' }
	assert_response :success
  end
end
