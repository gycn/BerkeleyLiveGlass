class OrderConfirmation < ApplicationMailer
  default from: "orders@berkeleyliveglass.me"
  def confirm(arg)
    @arg = arg
    mail(to: @arg[:email], subject: 'Berkeley Live Glass Order Confirmation')
  end
end
