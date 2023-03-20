class Product < ApplicationRecord
    has_many :pictures 
    has_many :orders 

    validates :name, presence: true, uniqueness: true 
    validates :description, presence: true, length: { minimum: 20, maximum: 300 }
    # validates :cost, numerical: true 
    validates :inventory, presence: true
    validates :color, presence: true
end
