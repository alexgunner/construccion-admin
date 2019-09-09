class Stock < ApplicationRecord
  belongs_to :product_variant

  def self.search(search)
    if search
      product_variant = ProductVariant.where('code LIKE ?', "%#{search}%").collect{|x| x.id}
      Stock.where(product_variant_id: product_variant)
    else
      Stock.all
    end
  end

  def self.search_report(search)
    if search
      Stock.joins(:product_variant)
    else
    end
  end
end
