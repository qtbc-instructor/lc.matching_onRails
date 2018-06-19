class Status < ApplicationRecord
  belongs_to :user,:company,:skill_master,:status_master
end
