# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hello@magic-store.com'
  layout 'mailer'
end
