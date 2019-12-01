class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :bio, presence: true
  validates :expertise, presence: true
  validates :occupation, presence: true
  validates :email, uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
end
