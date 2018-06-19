class User < ApplicationRecord
<<<<<<< HEAD
  has_one :company
  has_one :user
=======
  #has_secure_password
  has_one :company
  has_one :status
>>>>>>> 55770998331d25d25c98a87620ff3ee67cd666bf
  has_many :freeday
  has_many :skill
  has_secure_password
end
