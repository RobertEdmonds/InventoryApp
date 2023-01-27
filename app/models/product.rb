class Product < ApplicationRecord
    has_many :pictures 
    has_many :orders 
end
