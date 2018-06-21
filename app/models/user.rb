
class User < ApplicationRecord
  has_one :company
<<<<<<< HEAD
  has_many :freeday
  has_many :skill
  # has_secure_password
=======
  has_one :user
  has_many :freeday
  has_many :skill
  has_secure_password
>>>>>>> fdc67004b31aea25a45cd24a393607010e0657be
end
