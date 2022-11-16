class CreateCustomerProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_products do |t|
      t.integer :customer_id
      t.integer :product_id
      t.timestamps
    end
  end
end
