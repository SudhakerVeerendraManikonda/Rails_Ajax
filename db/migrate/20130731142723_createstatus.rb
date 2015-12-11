class Createstatus < ActiveRecord::Migration
  def change
	create_table :statuses do |t|
      t.string :status_description

      t.timestamps
    end
  end
end
