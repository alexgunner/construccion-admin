class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  deserializable_resource :order, only: [:create, :update]

  # GET /orders
  def index
    @orders = Order.all
    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  def pay
    receiver_id = 181015
    secret_key = "d45a7bf32e03c687a0ede52bc9b2aa56ee61c23a"

      Khipu.configure do |c|
        c.secret = secret_key
        c.receiver_id = receiver_id
        c.platform = 'demo-client'
        c.platform_version = '2.0'
        c.debugging = true
      end
    client = Khipu::PaymentsApi.new
    response = client.payments_post('Pago de productos TodoConstruccion', 'BOB', 100, {
        transaction_id: 'FACT2001',
        expires_date: DateTime.new(2018, 10, 10),
        body: 'Descripccion',
        return_url: 'http://localhost:3000/return_from_payment',
        cancel_url: 'http://localhost:3000/cancel_payment',
        notify_url: 'http://localhost:3000/notify_payment',
        notify_api_version: '1.3',
        payer_name: 'Pago para Demo',
        payer_email: 'dharamadai@gmail.com',
        personal_identifier: '3548879',
        send_email: false
    })
    redirect_to response.payment_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:orderdate, :client_id)
    end
end
