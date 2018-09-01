class ProductDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def product_status
    object.status
  end
end
