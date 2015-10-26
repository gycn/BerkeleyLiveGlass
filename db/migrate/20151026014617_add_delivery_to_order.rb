class AddDeliveryToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.string :delivery
    end
  end
end
