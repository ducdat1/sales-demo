class Post < ApplicationRecord
  has_many :interactions, :dependent => :destroy
  has_many :users, through: :interactions
  has_many :comments, dependent: :destroy

  validates :title, :uniqueness => true
  validates :title, :content, :presence => true
end
