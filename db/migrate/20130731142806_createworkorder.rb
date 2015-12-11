class Createworkorder < ActiveRecord::Migration
  def change
	create_table :workorders do |t|
      t.string :work_details
      t.integer :worker_id
      t.integer :status_id
      t.datetime :date_of_creation
      t.datetime :last_updated_at

      t.timestamps
    end
  end
end
