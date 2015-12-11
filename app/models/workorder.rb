class Workorder < ActiveRecord::Base
  belongs_to :worker
  belongs_to :status
  validates_presence_of :worker, :status ,:work_details 
  
  def self.search(selected_status)
	Workorder.where("status_id = #{selected_status}" )		
  end  
  
  def self.orderall()
	Workorder.all.joins(:worker).order('lower(first_name),last_name ASC')
  end
end
