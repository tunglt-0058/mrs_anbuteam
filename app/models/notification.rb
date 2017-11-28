class Notification < ApplicationRecord
  belongs_to :recipient, class_name: User.name
  belongs_to :movie

  belongs_to :notiable, polymorphic: true


  default_scope -> {order created_at: :desc}

  validates :recipient, presence: true
  validates :movie, presence: true
end
