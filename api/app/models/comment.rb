class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio

  validates :body, presence: true
end
