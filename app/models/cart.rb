class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id)
  #def add_product(product_id,product_price)  
    current_item = line_items.find_by_product_id(product_id)
    #current_item = line_items.where(:product_id => product_id).first
     if current_item 
        current_item.quantity = current_item.quantity.to_i + 1
      else
        current_item = line_items.build(:product_id => product_id)
        #current_item = LineItem.new(:product_id=>product_id, :price=>product_price)
        current_item.price = current_item.product.price
         #line_items << current_item
      end
        current_item
   end

  def total_price
   Array.wrap(line_items).sum { |item| item.total_price }
  end
   # def total_price
      # line_items.to_a.each(&:total_price).sum
   # end
end
