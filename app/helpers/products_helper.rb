module ProductsHelper
  def number_to_currency price
    sprintf("$%0.02f", price)
  end
end
