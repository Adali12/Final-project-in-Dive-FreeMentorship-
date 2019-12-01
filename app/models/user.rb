class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy

  has_secure_password
end
