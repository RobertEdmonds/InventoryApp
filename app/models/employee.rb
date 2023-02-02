class Employee < ApplicationRecord
    has_secure_password

    PASSWORD_REQUIREMENTS = /\A
        (?=.{8,}) # At least 8 characters long
        (?=.*\d) # Contain at least one number
        (?=.*[a-z]) # Contain at least one lowercase letter
        (?=.*[A-Z]) # Contain at least one uppercase letter
        (?=.*[[:^alnum:]]) # Contain at least one symbol
        /x

    has_many :orders 
    has_many :rented_samples
    has_many :products, through: :orders
    has_many :samples, through: :rented_samples

    validates :name, presence: true, uniqueness: true 
    validates :phone_number, presence: true, uniqueness: true 
    validates :password, format: PASSWORD_REQUIREMENTS, confirmation: true, unless: {|employee| employee.amount_of_logins == 0} 
end
