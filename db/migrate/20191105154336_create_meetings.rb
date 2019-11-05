class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :location
      t.string :venue
      t.datetime :appointment
      t.integer :user_id
      t.integer :suitor_id
      t.timestamps
    end
  end
end
