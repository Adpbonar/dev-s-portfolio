class Project < ApplicationRecord
  belongs_to :user
  has_rich_text :project_info
  has_one_attached :project_image
end
