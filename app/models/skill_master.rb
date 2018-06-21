class SkillMaster < ApplicationRecord
<<<<<<< HEAD
  has_many :skill
  has_many :status
=======
  has_one :skill
  has_one :status
>>>>>>> fdc67004b31aea25a45cd24a393607010e0657be
end
