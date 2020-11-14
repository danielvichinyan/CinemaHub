class ApplicationMailer < ActionMailer::Base
  default to: 'info@cinehub.com',from: 'info@cinehub.com'
  layout 'mailer'
end
