class User < ApplicationRecord
  has_many :orders

  devise :confirmable, :database_authenticatable, :lockable, :registerable, :recoverable, :rememberable, :timeoutable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user |
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]

      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token

      user.skip_confirmation!
    end
  end

end
