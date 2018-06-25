class Company < ApplicationRecord
  belongs_to :User,optional: true

  #バリデーション
  validates :companyname , presence: true
  has_many :status
end
