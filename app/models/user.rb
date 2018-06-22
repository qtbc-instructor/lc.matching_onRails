
class User < ApplicationRecord

  has_one :company
  has_many :status
  has_many :freeday
  has_many :skill
  has_secure_password

  accepts_nested_attributes_for :company
  #バリデーション
  validates :name , :tel , :mail_address , :password , presence: true

  validates :tel , :mail_address, uniqueness: true

  validates :tel , format: {with: /\A\d{1,4}-\d{1,4}-\d{3,4}\z/}
  validates :mail_address , format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
  validates :password , length: {minimum: 6 , maximum: 12}
  has_one :user
end
