# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'powow.help@gmail.com'
  layout 'mailer'
end
