class AddSoldToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sold, :integer
  end
end
