class User < ApplicationRecord
  has_many :events
  has_many :tickets
  has_many :venues

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :rol, presence: true, inclusion: {in: ["ADMINISTRADOR", "ORGANIZADOR", "COMPRADOR"]}
  validates :password, length: { in: 6..20 }
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
end
