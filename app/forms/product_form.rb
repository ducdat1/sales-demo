class ProductForm
  include ActiveModel::Model

  attr_accessor :title, :price, :email, :description, :image_url, :category_id
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {greater_than_or_equal_to: 0.01}
  # validates :title, :uniqueness => true
  # validates :image_url, :format => {
  #     :with => /\.(gif|jpg|png)/i,
  #     :message => "must be GIF, JPG or PNG"
  # }

  def product
    @product ||= Product.new
  end
  def insert(params)
    product.attributes = params.slice(:title, :price, :email, :description, :image_url, :category_id)
    if valid?
      product.save!
      true
    else
      # sent_notifications
      false
    end
  end

  #TODO: send mail admin
  def sent_notifications
    # sent email to admin if error
  end
end