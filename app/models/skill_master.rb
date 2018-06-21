class SkillMaster < ApplicationRecord
<<<<<<< HEAD
  has_one :skill
  has_one :status
=======
  has_many :skill
  has_many :status
>>>>>>> origin/company
end
