class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors[:base] << "Line Items present"
      return false
    end
  end
  
  default_scope :order => 'title'
  validates :title , :description ,:image_url, :presence =>true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url,    :uniqueness => true
  validates :price, :numericality => {:less_than_or_equal_to =>    1000}
  
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a Gif,Jpg,PNG file format pictures.'
  }
end
