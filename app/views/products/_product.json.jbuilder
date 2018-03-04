json.extract! product, :id, :name, :description, :price, :color, :code, :measure_id, :provider_id, :manufacturer_id, :category_id, :subcategory_id, :created_at, :updated_at
json.url product_url(product, format: :json)
