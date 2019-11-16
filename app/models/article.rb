class Article < ApplicationRecord
  belongs_to :user
  has_rich_text :post
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :post, presence: true, length: { minimum: 10, maximum: 10000 }
  validates :snippet, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :user, presence: true
  validates :published, inclusion: { in: [ true, false ] }


  def article_posted
    if (Time.now >= self.scheduled_for) && (self.draft == false)
      self.update(published: true)
      return true
    elsif self.draft == true
      self.update(published: false)
      return false
    end
  end

  def article_post_scheduled
    if (Time.now < self.scheduled_for) && (self.draft == "false")
      self.update(published: false)
      return true
    end
  end
end
