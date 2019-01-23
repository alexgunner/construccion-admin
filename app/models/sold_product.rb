class SoldProduct < ApplicationRecord
  belongs_to :product_variant

  def self.ordenar(ordenar)
    if ordenar == "Código de Variante"
      SoldProduct.joins(:product_variant).order('code ASC')
    else
      if ordenar == "Cantidad (mayor a menor)"
        SoldProduct.order('quantity DESC')
      else
        if ordenar == "Cantidad (menor a mayor)"
          SoldProduct.order('quantity ASC')
        else
          if ordenar == "Total Ventas"
              SoldProduct.order('total_sold DESC')
          end
        end
      end
    end
  end

  def self.search(search)
    if search
      SoldProduct.joins(:product_variant).where('code LIKE ?', "%#{search}%")
    else
      SoldProduct.all
    end
  end
end
