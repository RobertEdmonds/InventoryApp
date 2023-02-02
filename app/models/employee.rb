class Employee < ApplicationRecord
    has_secure_password
    has_many :orders 
    has_many :rented_samples
    has_many :products, through: :orders
    has_many :samples, through: :rented_samples

    validates :name, presence: true, uniqueness: true 
    validates :phone_number, presence: true, uniqueness: true 
end
