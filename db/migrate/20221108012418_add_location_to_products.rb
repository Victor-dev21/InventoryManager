class AddLocationToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :location_id, :integer
  end
end
