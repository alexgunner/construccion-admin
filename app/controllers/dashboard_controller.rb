class DashboardController < ApplicationController
	before_action :authenticate_user!
	layout "dashboard"
	def index

	end

	def messages
		@messages = Message.all.reverse
	end

	def post_message
		Message.create! name: params[:name], phone: params[:phone], email: params[:email], country: params[:country], city: params[:city], message: params[:message]
		redirect_to '/contact'
	end
end
