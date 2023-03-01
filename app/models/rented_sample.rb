class RentedSample < ApplicationRecord
  belongs_to :user
  belongs_to :employee
  belongs_to :sample

  validates :user_id
  validates :employee_id, presence: true 
  validates :sample_id, presence: true 
  
end
