class User < ApplicationRecord
  has_secure_password

  validates :email, :presence => true
  validates :username, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["name"]).first_or_create do |user|
      # for simplification purposes, the username & email for an omniauth user
      # will be exactly the same value because we never need to know the email
      # address of the user in this program, additionally, there is no actual
      # email address exposed within the auth_hash from GitHub.
      user.password = SecureRandom.hex, user.username = auth_hash["info"]["name"]
    end
  end
end
