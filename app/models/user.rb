class User < ApplicationRecord
  #has_secure_password
  has_one :company,:status
  has_many :freeday,:skill
  has_secure_password
end
