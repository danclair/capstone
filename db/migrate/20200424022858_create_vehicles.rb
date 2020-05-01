class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :nickname
      t.integer :make_id
      t.integer :vehicle_model_id
      t.string :year
      t.boolean :owner
      t.string :color
      t.integer :trim_id
      t.integer :user_id

      t.timestamps
    end
  end
end
