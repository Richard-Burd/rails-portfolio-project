class User < ApplicationRecord
  has_secure_password

  validates :email, :presence => true
  validates :username, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  # This method gets created here:
  # https://www.youtube.com/watch?v=UAvuo-EbTFY (38:00 / 56:18)
  # The "auth_hash" below is set to the value of request.env["omniauth.auth"]
  # in the sessions controller's create action.
  def self.find_or_create_by_omniauth(auth_hash)
    # The "first_or_create" ActiveRecord method will find the first instance
    # where the user's username is the same as the [:info][:name] value inside
    # the auth_hash.  If no such name exists, ActiveRecord will create a new user.
    # "first_or_create" will always return an instance of a user.
    self.where(:username => auth_hash["info"]["name"]).first_or_create do |user|
      # This user is using OmniAuth.  Here we assume they will never need to login
      # to this Rails app using the non-OmniAuth [standard] login means.  To that end,
      # an OmniAuth user will never enter a password on this Rails app (only on GitHub)
      # and so on the next line of code below, we need to assign them a password
      # because the User.rb model requires all users to have such a password.
      # "SecureRandom.hex" will assign a number that hackers won't be able to guess
      user.password = SecureRandom.hex,
      if auth_hash["info"]["email"] == nil # that is, no email address is listed.
        # some GitHub users have their email set to private.  If that is the
        # case, the user's email address will be set to this value below:
        user.email = "unknown because GitHub doesn't share your email"
      else # if the user's GitHub account has a public email address...
        # the user's email address in this app will be the same as their GitHub
        # email address.
        user.email = auth_hash["info"]["email"]
      end
    end
  end
end
