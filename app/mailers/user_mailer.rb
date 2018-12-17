class UserMailer < ApplicationMailer
  default from: 'compras.domusbolivia@gmail.com'
  layout 'mailer'

 def confirmation_email(order)
   @order = order
   mail(to: @order.client.mail, subject: '¡Gracias por tu compra!. Comprobante de productos adquiridos.')
 end

 def rejected_email(order)
   @order = order
   mail(to: @order.client.mail, subject: '¡Ha ocurrido un error!. Por favor lee este correo con atención.')
 end

 def sent_email(order)
   @order = order
   mail(to: @order.client.mail, subject: '¡Orden enviada!. Tu orden se encuentra en camino.')
 end
end
