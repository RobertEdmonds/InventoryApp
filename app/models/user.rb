class User < ApplicationRecord
    has_many :samples 
    has_many :orders 
    has_many :products, through: :orders 
    has_many :rented_samples
    has_many :samples, through: :rented_samples

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :phone_number, presence: true, length: { minimum: 6 }
    validates :address, presence: true, uniqueness: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true
end
