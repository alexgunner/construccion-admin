class UserMailer < ApplicationMailer
  default from: 'compras.domusbolivia@gmail.com'
  layout 'mailer'

 def confirmation_email(order)
   @order = order
   mail(to: @order.client.mail, subject: 'Gracias, por tu compra')
 end
end
