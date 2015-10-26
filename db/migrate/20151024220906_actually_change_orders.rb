class ActuallyChangeOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.integer :quantity
      t.text :instructions
    end
  end
end
