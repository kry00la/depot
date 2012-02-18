class StoreController < ApplicationController
  def index
    @product = Product.all
    @count = session_count
  end

end
