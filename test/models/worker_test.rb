require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @worker = Worker.new(
      :first_name => 'veeru', :last_name => 'manikonda')
  end

  test "create worker" do
    assert Worker.create(
      :first_name => 'vichu', :last_name => 'wizard')
  end

  test "worker first name required" do
    @worker.first_name = ''
    assert !@worker.valid?, 'first name must not be blank'
    assert @worker.errors.full_messages_for(:first_name).include? "First name can't be blank"
  end

  test "worker last name required" do
    @worker.last_name = ''
    assert !@worker.valid?, 'last name must not be blank'
    assert @worker.errors.full_messages_for(:last_name).include? "Last name can't be blank"
  end

end
