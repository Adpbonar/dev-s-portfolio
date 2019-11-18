class User < ApplicationRecord
  has_many :articles
  has_many :projects
  has_many :code_samples
  has_many :index_documents
  has_many :about_documents
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
end
