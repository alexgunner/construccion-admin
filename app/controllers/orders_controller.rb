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
    @order = Order.find(params[:id])
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    if @order.save
      UserMailer.receive_email(@order).deliver_now
      render json: @order
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      UserMailer.deposit_email(@order).deliver_now
      redirect_to '/ordenes', notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def change
    @order = Order.find(params[:id])
  end

  def do_change
    order = Order.find(params[:do_change][:id])
    state = params[:do_change][:state]
    order.comment = params[:do_change][:comment]
    order.picture = params[:do_change][:picture]
    if state == "Preparado"
      UserMailer.confirmation_email(order).deliver_now
    end
    if state == "Rechazado"
      UserMailer.rejected_email(order).deliver_now
    end
    order.state = params[:do_change][:state]
    if state == "Enviado"
      order.carts.each do |cart|
        stock = Stock.where("product_variant_id = ?", cart.product_variant).first
        quantity_actual = stock.quantity
        stock.quantity = quantity_actual - cart.quantity
        stock.save
      end
      UserMailer.sent_email(order).deliver_now
    end
    order.save
    redirect_to "/ordenes"
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to '/ordenes', notice: 'Order was successfully destroyed.'
  end

  def pay
    @order = Order.find(params[:id])
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
    response = client.payments_post('Pago de productos DOMUS S.R.L.', 'BOB', @order.total, {
        transaction_id: 'FACT' + @order.id.to_s,
        expires_date: DateTime.new(2019, 3, 10),
        body: 'El monto total de los productos se muestra a continuación, por favor complete la operación.
        Gracias.',
        return_url: 'http://todo-construccion.herokuapp.com',
        #cancel_url: 'http://localhost:3000/cancel_payment',
        #notify_url: 'http://localhost:3000/notify_payment',
        notify_api_version: '1.3',
        payer_name: 'Pago para Demo',
        payer_email: @order.client.mail,
        personal_identifier: '3548879',
        send_email: false
    })
    redirect_to response.payment_url
  end

  #Metodos para admin
  def list
    orders_list = Order.all
    orders_list.each do |order|
      if order.state == "Cancelado"
        if order.client.count > 1
          order.client.decrement(:count,1)
          order.client.save
        else
          order.client.destroy
        end
        order.carts.each do |cart|
          cart.destroy
        end
        order.destroy
      end
    end
    @orders = Order.search(params[:search])
  end

  def calculateTotal
    order = Order.find(params[:id])
    cost_transport = order.delivery.cost.to_i
    costmin_transport = order.delivery.costmin.to_i
    cost_total_transport = 0
    mult = 0
    if (order.typedelivery == "Domicilio" or order.typedelivery == "Transportista")
      cost_transport = order.delivery.cost.to_i
    end
    order.carts.each do |cart|
      price = cart.product_variant.price
      if cart.product_variant.offerprice.nil?
        if cart.role == "Mayorista "
          price = cart.product_variant.wholesaleprice
        end
        if cart.role == "Especialista "
          price = cart.product_variant.specialistprice
        end
        if cart.role == "Cliente DOMUS "
          price = cart.product_variant.importerprice
        end
      else
        price = cart.product_variant.offerprice
      end
      mult = mult + (cart.quantity * price)
      cost_total_transport = cost_transport * cart.product_variant.weight.to_i * cart.quantity
    end
    if order.typedelivery == "Tienda"
      order.cost = 0
    else
      if order.delivery.typedelivery !="Local"
        if cost_total_transport >= costmin_transport
          order.cost = cost_total_transport
          mult = mult + cost_total_transport
        else
          order.cost = costmin_transport
          mult = mult + costmin_transport
        end
      else
        order.cost = cost_transport
        mult = mult + cost_transport
      end
    end

    order.total = mult
    order.save
    puts order.total
  end

  def total(id)
    order = Order.find(id)
    cost_transport = order.delivery.cost.to_i
    costmin_transport = order.delivery.costmin.to_i
    cost_total_transport = 0
    mult = 0
    if (order.typedelivery == "Domicilio" or order.typedelivery == "Transportista")
      cost_transport = order.delivery.cost.to_i
    end
    order.carts.each do |cart|
      price = cart.product_variant.price
      if cart.product_variant.offerprice.nil?
        if cart.role == "Mayorista "
          price = cart.product_variant.wholesaleprice
        end
        if cart.role == "Especialista "
          price = cart.product_variant.specialistprice
        end
        if cart.role == "Cliente DOMUS "
          price = cart.product_variant.importerprice
        end
      else
        price = cart.product_variant.offerprice
      end
      mult = mult + (cart.quantity * price)
      cost_total_transport = cost_transport * cart.product_variant.weight.to_i * cart.quantity
    end
    if order.typedelivery == "Tienda"
      order.cost = 0
    else
      if order.delivery.typedelivery !="Local"
        if cost_total_transport >= costmin_transport
          order.cost = cost_total_transport
          mult = mult + cost_total_transport
        else
          order.cost = costmin_transport
          mult = mult + costmin_transport
        end
      else
        order.cost = cost_transport
        mult = mult + cost_transport
      end
    end

    order.total = mult
    order.save
    puts order.total
  end

  def reports
    @fechaInicio = params[:fechaInicio]
    if @fechaInicio
      @fechaFin = params[:fechaFin]
    else
      @fechaFin = Date.current.to_s
      @fechaInicio= ((Date.current)-30).to_s  # resta 1 semana
    end
    @domicilio_tarjeta = Order.where('typepay = ? and typedelivery = ? and updated_at >= ? and updated_at <= ?', "Tarjeta", "Domicilio", @fechaInicio, @fechaFin).count
    @tienda_tarjeta = Order.where('typepay = ? and typedelivery = ? and updated_at >= ? and updated_at <= ?', "Tarjeta", "Tienda", @fechaInicio, @fechaFin).count

    @domicilio_contraentrega = Order.where('typepay = ? and typedelivery = ? and updated_at >= ? and updated_at <= ?', "Contraentrega", "Domicilio", @fechaInicio, @fechaFin).count
    @tienda_contraentrega = Order.where('typepay = ? and typedelivery = ?', "Contraentrega", "Tienda").count

    @domicilio_deposito = Order.where('typepay = ? and typedelivery = ? and updated_at >= ? and updated_at <= ?', "Deposito", "Domicilio", @fechaInicio, @fechaFin).count
    @tienda_deposito = Order.where('typepay = ? and typedelivery = ? and updated_at >= ? and updated_at <= ?', "Deposito", "Tienda", @fechaInicio, @fechaFin).count

    @array_tarjeta = []
    @array_contraentrega = []
    @array_deposito = []
    if !params[:date].nil?
      for i in 1..12
        if i < 10
          count_tarjeta = Order.where('typepay = ? and orderdate <= ?', "Tarjeta", params[:date][:year].to_s + "-" + "0" + i.to_s + "-31 00:00:00.000000").count
          count_contraentrega = Order.where('typepay = ? and orderdate <= ?', "Contraentrega", params[:date][:year].to_s + "-" + "0" + i.to_s + "-31 00:00:00.000000").count
          count_deposito = Order.where('typepay = ? and orderdate <= ?', "Deposito", params[:date][:year].to_s + "-" + "0" + i.to_s + "-31 00:00:00.000000").count
        else
            count_tarjeta = Order.where('typepay = ? and orderdate <= ?', "Tarjeta", params[:date][:year].to_s + "-" + i.to_s + "-31 00:00:00.000000").count
            count_contraentrega = Order.where('typepay = ? and orderdate <= ?', "Contraentrega", params[:date][:year].to_s + "-" + i.to_s + "-31 00:00:00.000000").count
            count_deposito = Order.where('typepay = ? and orderdate <= ?', "Deposito", params[:date][:year].to_s + "-" + i.to_s + "-31 00:00:00.000000").count
        end
        @array_tarjeta << count_tarjeta
        @array_contraentrega << count_contraentrega
        @array_deposito << count_deposito
      end
    end

  end

  def reports_list
    @orders = Order.search_by_role(params[:search])
  end

  def show_order
    @order = Order.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:orderdate, :client_id, :deliveryid, :state, :typepay, :typedelivery, :image, :picture, :userid, :office, :cost)
    end
end
