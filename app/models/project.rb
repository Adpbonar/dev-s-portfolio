class Project < ApplicationRecord
  has_rich_text :project_info
  has_one_attached :project_image
  belongs_to :user
end
