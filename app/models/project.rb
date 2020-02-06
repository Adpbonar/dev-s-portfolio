class Project < ApplicationRecord
  has_rich_text :project_info
  has_one_attached :project_image
  belongs_to :user
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :versions, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 10000 }
  validates :GitHub_link, presence: true
  
end
