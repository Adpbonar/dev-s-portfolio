class User < ApplicationRecord

  validates :password_complexity

  has_many :articles
  has_many :projects
  has_many :code_samples
  has_many :index_documents
  has_many :about_documents
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
    errors.add :password, 'Complexity requirement not met. Please use at least: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
