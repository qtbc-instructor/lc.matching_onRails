class Company < ApplicationRecord
  belongs_to :User,optional: true
  has_many :status
end
