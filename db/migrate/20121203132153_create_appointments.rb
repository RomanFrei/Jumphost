class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string	 :name
      t.text 	 :description
      t.integer	 :author_id

      t.timestamps
    end
  end
end
