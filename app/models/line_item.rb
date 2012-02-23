class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  # def total_price
      # product.price = product.price * quantity
  # end
  
  def total_price
  #price * quantity
     if product.price 
        product.price * quantity
      else
         0.to_s.to_d
      end
   end

=begin
  def total_price 
    if self.valid? 
      product.price * quantity 
    else 
      0.to_d 
    end 
  end 
=end
end
