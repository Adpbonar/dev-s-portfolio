class AboutDocument < ApplicationRecord
  belongs_to :user, required: false
  has_one_attached :image
end
