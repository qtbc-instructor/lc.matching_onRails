class User < ApplicationRecord
<<<<<<< HEAD
  has_one :company
  has_one :user
  has_many :freeday
  has_many :skill
=======
  #has_secure_password
  has_one :company,:status
  has_many :freeday,:skill
>>>>>>> 45f0c82d7c4fe913a3e6b5b4e37d4cca269ab2d5
  has_secure_password
end
