class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :content, presence: true

  def parent
    Comment.find_by id: self.parent_id
  end

  def reply
    Comment.find_by id: self.reply_id
  end

  def reply_comments
    user_id = self.id
    Comment.where(parent_id: user_id).where.not(id: user_id).order id: :desc
  end
end
