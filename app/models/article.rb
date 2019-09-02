class Article < ApplicationRecord
  belongs_to :user
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :post, presence: true, length: { minimum: 10, maximum: 10000 }
  validates :snippet, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :user, presence: true
  validates :published, inclusion: { in: [ true, false ] }
end
