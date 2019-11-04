class CreateSuitors < ActiveRecord::Migration[5.2]
  def change
    create_table :suitors do |t|
      t.string :name
      t.string :occupation
      t.integer :age
    end
  end
end
