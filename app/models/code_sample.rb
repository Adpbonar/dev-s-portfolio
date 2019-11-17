class CodeSample < ApplicationRecord
  belongs_to :user
  has_rich_text :code_info
  extend FriendlyId
  friendly_id :title, use: :slugged
end
