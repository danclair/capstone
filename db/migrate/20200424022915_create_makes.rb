class CreateMakes < ActiveRecord::Migration[6.0]
  def change
    create_table :makes do |t|
      t.string :manufacturer

      t.timestamps
    end
  end
end
