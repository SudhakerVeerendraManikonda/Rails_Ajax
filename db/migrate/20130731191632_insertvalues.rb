class Insertvalues < ActiveRecord::Migration
  def change
	Worker.create(:first_name => "John" , :last_name => "Smith")
	Worker.create(:first_name => "John" , :last_name => "Morgan")
	
	Status.create(:status_description => "Created")
	Status.create(:status_description => "In Progress")
	Status.create(:status_description => "Review")
	Status.create(:status_description => "Completed")
	
	
	Workorder.create(  :work_details => "Assignment1",
                       :date_of_creation => DateTime.now ,
                       :status_id => 1 ,
                       :worker_id => 1 ,
                       :last_updated_at => DateTime.now  )					   
    					   
  end
end
