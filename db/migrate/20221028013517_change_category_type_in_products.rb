class ChangeCategoryTypeInProducts < ActiveRecord::Migration[6.1]
  def up
    change_table :products do |t|
      t.change :category, :integer
    end
  end
  def down
    change_table :products do |t|
      t.change :category, :string
    end
  end
end
