# The WelcomeController Class handles the home page of the application.
# The WelcomeController Class handles the contact page as well as sending a contact email.
class WelcomeController < ApplicationController
  # Index Page
  def index
    @events = Event.all.reverse
  end

  # Contact Page
  def contact
  end

  # Movies Page
  def movies
  end

  # Send email 
  def request_contact
    name = params[:name]
    email = params[:email]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18m.t('welcome.request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, message).deliver_now
      flash[:notice] = I18n.t('welcome.request_contact.email_sent')
    end

    redirect_to root_path
  end
end
