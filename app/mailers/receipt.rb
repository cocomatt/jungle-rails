class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    @order = order
    mail(to: @user.email, subject: 'Thank you for your order! Order # #{@order.id}')
  end
end
