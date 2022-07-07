class Task < ApplicationRecord
  validates :title, presence: true 
  validates :content, presence: true
  validates :period, presence: true
  scope :latest, -> {order(updated_at: :desc)}
  enum status: {未着手:1,着手中:2,完了:3}
end
