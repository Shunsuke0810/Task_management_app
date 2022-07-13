class Task < ApplicationRecord
  validates :title, presence: true 
  validates :content, presence: true
  validates :period, presence: true

  belongs_to :user

  scope :search_title_and_status, 
  -> (search_title_and_status) {all.where("title LIKE ?","%#{search_title_and_status[0]}%").where(status: search_title_and_status[1])}
  scope :search_title, 
  -> (search_title) {all.where("title LIKE ?","%#{search_title}%")} 
  scope :search_status, 
  -> (search_status) {where(status: search_status)}
  scope :sort_period,
  -> {order(period: :desc)}
  scope :sort_priority,
  -> {order(priority: :asc)}
  scope :default,
  -> {all.order(created_at: "ASC")}
  
  enum status: {未着手:1,着手中:2,完了:3}
  enum priority: {高:1,中:2,低:3}
  

end
