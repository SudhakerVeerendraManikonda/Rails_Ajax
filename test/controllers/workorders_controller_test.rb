require 'test_helper'

class WorkordersControllerTest < ActionController::TestCase
  setup do
    @workorder = workorders(:one)
  end

  test "should get index" do
    get :index , :format => 'js'
    assert_response :success
    assert_not_nil assigns(:workorders)
  end

  test "should get new" do
    get :new , :format => 'js'
    assert_response :success
  end

  test "should hide worker" do
    get :hide, :format => 'js', id: @worker
    assert_response :success
  end

  test "should create workorder" do
    assert_difference('Workorder.count') do
      post :create, :format => 'js', workorder: { date_of_creation: @workorder.date_of_creation, last_updated_at: @workorder.last_updated_at, status_id: @workorder.status_id, work_details: @workorder.work_details, worker_id: @workorder.worker_id }
    end

    assert_response :success
  end

  test "should show workorder" do
    get :show, :format => 'js', id: @workorder
    assert_response :success
  end

  test "should get edit" do
    get :edit, :format => 'js', id: @workorder
    assert_response :success
  end
  
  test "should get assign" do
    get :assign, :format => 'js', id: @workorder
    assert_response :success
  end

  test "should update workorder" do
    patch :update, :format => 'js', id: @workorder, workorder: { date_of_creation: @workorder.date_of_creation, last_updated_at: @workorder.last_updated_at, status_id: @workorder.status_id, work_details: @workorder.work_details, worker_id: @workorder.worker_id }
    assert_response :success
  end

  test "should destroy workorder" do
    assert_difference('Workorder.count', -1) do
      delete :destroy, :format => 'js', id: @workorder
    end

    assert_response :success
  end
  
  test "should not create work order" do
    post :create, :format => 'js', workorder: { :date_of_creation => '2013-07-29 09:59:47', :last_updated_at => '2013-07-29 09:59:47',  :work_details => '' ,  :status_id => '45', :worker_id => '45'  }
	assert_response :success
  end
  
  test "should not update work order" do
    patch :update, :format => 'js', id: @workorder, workorder: { :date_of_creation => '2013-07-29 09:59:47', :last_updated_at => '2013-07-29 09:59:47',  :work_details => '' ,  :status_id => '45', :worker_id => '45'  }
	assert_response :success
  end
  
  test "should test the filter parameter" do
    get :filter_status , :format => 'js' , :status_id => '2'
    assert_response :success
    assert_not_nil assigns(:workorders)
  end
  
end
