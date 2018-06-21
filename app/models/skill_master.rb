class SkillMaster < ApplicationRecord
  has_many :skill
  has_many :status
  has_one :skill
  has_one :status
end
