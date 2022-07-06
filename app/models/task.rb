class Task < ApplicationRecord
  validates :title, presence: true 
  validates :content, presence: true
  validates :period, presence: true
  scope :latest, -> {order(updated_at: :desc)}
end
