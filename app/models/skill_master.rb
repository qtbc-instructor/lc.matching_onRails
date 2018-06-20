class SkillMaster < ApplicationRecord
  has_many :skill
  has_many :status
end
