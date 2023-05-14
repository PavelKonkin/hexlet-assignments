# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation
    # BEGIN
    @user = params[:user]
    @user_name = params[:user_name]
    @email = params[:email]
    @confirmation_token = params[:confirmation_token]
    mail(to: @email, subject: t('.subject'))
    # END
  end
end
