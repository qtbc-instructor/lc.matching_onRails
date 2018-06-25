class Company < ApplicationRecord
  belongs_to :User,optional: true
  has_one :status

  #バリデーション
  validates :companyname , presence: true
end
