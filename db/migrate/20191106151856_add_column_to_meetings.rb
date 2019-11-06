class AddColumnToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :rating, :integer
    add_column :meetings, :note, :string
  end
end
