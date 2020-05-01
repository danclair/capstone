class CreateTrims < ActiveRecord::Migration[6.0]
  def change
    create_table :trims do |t|
      t.string :name
      t.integer :make_id

      t.timestamps
    end
  end
end
