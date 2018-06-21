
class User < ApplicationRecord
  has_one :company
<<<<<<< HEAD
  has_one :user
  has_many :freeday
  has_many :skill
  has_secure_password
=======
  has_many :freeday
  has_many :skill
  # has_secure_password
>>>>>>> origin/company
end
