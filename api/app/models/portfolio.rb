class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :content, presence: true

  def self.search(keyword)
    where(["name like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def create_new
    @portfolio = Portfolio.published.order(created_at: :desc)
  end

  enum status: { published: 0, draft: 1 }
  mount_uploader :image, ImageUploader
end
