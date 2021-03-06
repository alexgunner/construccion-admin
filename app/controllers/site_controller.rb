class SiteController < ApplicationController
	before_action :set_categories, :is_index, :is_contact, :is_about, :is_store
	helper_method :cart_exist
	def index
		@products_in_offer = Product.where(offer: true)
		@main_carousels = Carousel.all.where(pic_type: true)
		@index = true
	end

	def contact
		@contact_information = Contact.first
		@contact = true
	end

	def about_us
		@categories = Category.all
		@contact_information = Contact.first
		@abouts = About.all
		@about = true
	end

	def product_categories
		@categories = Category.all
	end

	def product_subcategories
		@subcategories = Subcategory.all
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

	def servicios
		@services = Service.all
	end

	def offices_list
		@offices = Office.all
		@store = true
	end

	def training_list
		@training_categories = TrainingCategory.all
		@trainings = Training.all
	end

	def search
		search_name = params[:name].to_s
		search_name = search_name.downcase
		@products = []
		Product.all.each do |product|
			if product.name.downcase.include? search_name or product.description.downcase.include? search_name or product.subcategory.name.downcase.include? search_name or product.manufacturer.name.downcase.include? search_name
				@products.push product
			end
		end
	end

	def cart_exist(variant, user)
		cart = Cart.where('user_id = ? and product_variant_id = ? and state = false', user, variant).first
		if cart.nil?
		  return false;
		else
		  return true;
		end
	end

	def providers_list
		@providers = Provider.all.reverse
	end

	private
	def set_categories
		@categories = Category.order(number: :asc)
	end

	def is_index
		@index = false
	end

	def is_contact
		@contact = false
	end

	def is_about
		@about = false
	end

	def is_store
		@store = false
	end

end
