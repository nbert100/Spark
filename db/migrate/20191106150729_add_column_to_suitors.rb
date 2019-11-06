class AddColumnToSuitors < ActiveRecord::Migration[5.2]
  def change
    add_column :suitors, :dating_app, :string
    add_column :suitors, :hometown, :string
  end
end
