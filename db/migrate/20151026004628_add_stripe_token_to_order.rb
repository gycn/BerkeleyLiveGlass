class AddStripeTokenToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.string :stripeToken
    end
  end
end
