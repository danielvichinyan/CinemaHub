# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

    # Test Sending Email
    def contact_email
        ContactMailer.contact_email("daniel@me.com",
        "Daniel Vichinyan", @message = "Hello")
    end

end
