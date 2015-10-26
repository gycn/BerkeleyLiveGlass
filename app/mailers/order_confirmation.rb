class OrderConfirmation < ApplicationMailer
  default from: "berkeleyliveglass@gmail.com"
  def confirm(arg)
    @arg = arg
    mail(to: @arg[:email], subject: 'Berkeley Live Glass Order Confirmation')
  end
end
