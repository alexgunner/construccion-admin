class MainController < ApplicationController
  def index

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
    response = client.payments_post('Pago de productos TodoConstruccion', 'BOB', 300, {
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

end
