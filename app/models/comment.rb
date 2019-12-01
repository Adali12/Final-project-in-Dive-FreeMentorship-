class Comment < ApplicationRecord
  belongs_to :profile
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
end