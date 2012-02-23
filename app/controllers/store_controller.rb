class StoreController < ApplicationController
  def index
    @product = Product.all
    @count = session_count
    @cart = current_cart
  end

end
