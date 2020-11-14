# The class User provides validations and associations for the User Model
# The validations and associations are tested in test/models/user_test.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :forum_threads, :dependent => :destroy
  has_many :forum_posts, :dependent => :destroy

  # Username is NOT case sensitive
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # Checks if age is > 13, allow user to register an account
  validate :validate_age

  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # User Profile Image
  # If no image is uploaded, use missing.png
  has_attached_file :avatar, :style => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "../images/missing.png", validate_media_type: false
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter]

  # Username for login
  attr_writer :login

  # Read Twitter Image from URL
  attr_reader :avatar_remote_url

  # Username for login
  def login
    @login || self.username || self.email
  end

  # Override the function so that user can Log In with username instead of email
  # Allow users to recover their password or confirm their account using their username
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  # Twitter
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.nickname
      user.avatar = URI.parse(auth.info.image) if auth.info.image?
      user.age = auth.info.age
    end
  end

  # Twitter
  def email_required?
    false
  end

  # Read Twitter Image From URL
  def avatar_remore_url=(url_value)
    self.avatar = URI.parse(url_value)
    @avatar_remore_url = url_value
  end

  # User age validation
  def validate_age
    if age.present? && age < 13
      errors.add :age, 'You must be 13 years or older!'
    end
  end
end
