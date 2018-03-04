json.extract! provider, :id, :name, :description, :email, :phone, :address, :country, :city, :created_at, :updated_at
json.url provider_url(provider, format: :json)
