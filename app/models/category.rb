class Category < ApplicationRecord
  self.primary_key = 'cat_id'
  has_many :products, :dependent => :destroy

  validates :cat_id, :cat_name, :cat_content, :presence => true
  validates :cat_name, :cat_id,  :uniqueness => true

  def self.get_category
    select('cat_id, cat_name, cat_content').order('cat_name asc')
  end

end
