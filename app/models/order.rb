class Order < ActiveRecord::Base
  validates :name, presence: true 
  validates :email, presence: true
  validates :telephone, presence: true
  validates :quantity, presence: true, numericality: true
end
