class Post < ApplicationRecord
  validates :title, presence: true, length: {:minimum => 5}
  validates :content, presence: true
  belongs_to :user
  def to_s
    title
  end
  has_rich_text :content

  extend FriendlyId
  friendly_id :title, use: :slugged
end
