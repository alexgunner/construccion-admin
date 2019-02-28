class SiteController < ApplicationController
	before_action :set_categories

	def index
		@products_in_offer = Product.where(offer: true)
	end

	def contact
		@contact_information = Contact.first
	end

	def about_us
		@contact_information = Contact.first
	end

	def product_categories
	end

	def product_offers
		@products_in_offer = Product.where(offer: true)
	end

	def category_products
		@category = Category.find(params[:id])
	end

  def product_details
		@product = Product.find(params[:id])
	end

	def subcategory_products
		@subcategory = Subcategory.find(params[:id])
	end

	def manufacturer_products
		@manufacturer = Manufacturer.find(params[:id])
	end

	def services
		@services = Extra.first.services
	end

	def search
		search_name = params[:name].to_s
		search_name = search_name.downcase
		@products = []
		Product.all.each do |product|
			if product.name.downcase.include? search_name
				@products.push product
			end
		end
	end

	private
	def set_categories
		@categories = Category.order(name: :asc)
	end
end
