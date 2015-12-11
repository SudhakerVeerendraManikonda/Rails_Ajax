require 'test_helper'

class WorkorderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   setup do
    @workorder = Workorder.new(
      :work_details => 'Assign12', :worker_id => 1, :status_id => 1)
  end

  test "create workorder" do
    assert Workorder.create(
      :work_details => 'Assign123', :worker_id =>2, :status_id => 1)
  end

  test " work details name required" do
   @workorder.work_details = ''
   assert !@workorder.valid?, 'work order details must not be blank'  
   assert @workorder.errors.full_messages_for(:work_details).include? "Work details can't be blank"
  end
  
  test "work order search" do
	work_order = Workorder.search('1')
	assert_equal 0 , work_order.count
  end
  
  test "work order no worker id" do
	assert Workorder.create(:work_details => 'Assign123', :status_id => 1)
	assert !@workorder.valid?, 'worker id must not be blank' 
  end
  
  test "work order no status id" do
	assert Workorder.create(:work_details => 'Assign123', :worker_id => 1)
	assert !@workorder.valid?, 'status id must not be blank' 
  end

end
