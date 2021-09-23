class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, presence: true, length: { maximum: 10 }
  user_id :content, presence: true, length: { maximum: 255 }
end