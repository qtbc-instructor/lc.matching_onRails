
class Status < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :skill_master
  belongs_to :status_master
  belongs_to :score
end
