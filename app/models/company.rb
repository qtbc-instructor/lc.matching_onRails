class Company < ApplicationRecord
  belongs_to :User
  has_one :status
end
