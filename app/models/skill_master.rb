class SkillMaster < ApplicationRecord
  has_one :skill
  has_one :status
end
