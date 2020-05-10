class AddImageToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :image, :string
  end
end
