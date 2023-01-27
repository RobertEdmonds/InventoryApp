class RentedSample < ApplicationRecord
  belongs_to :user
  belongs_to :employee
  belongs_to :sample
end
