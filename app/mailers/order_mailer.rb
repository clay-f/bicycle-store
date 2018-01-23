class OrderMailer < ApplicationMailer
  default from: 'liyongfeit@163.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @greeting = "Hi"
    @order = order

    mail to: order.email, subject: 'bicycle store confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.mail, subject: "bicycle store shipped"
  end
end
