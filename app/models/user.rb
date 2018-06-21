
class User < ApplicationRecord
  has_one :company
  has_one :user
  has_many :freeday
  has_many :skill
  has_secure_password
end
