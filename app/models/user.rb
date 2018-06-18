class User < ApplicationRecord
  has_one :company,:status
  has_many :freeday,:skill
  has_secure_password
end
