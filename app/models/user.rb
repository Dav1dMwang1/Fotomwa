class User < ApplicationRecord
  has_many :orders, dependent: :nullify

  mount_uploader :avatar, AvatarUploader

  devise :confirmable, :database_authenticatable, :lockable, :registerable, :recoverable, :rememberable, :timeoutable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :email, presence: true, uniqueness: true

  def devise_mailer
    FotomwaMailer
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user |
      # parse_name(user, auth.info.name)
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.avatar = auth.info.image
      user.password = Devise.friendly_token[0, 20]

      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token

      user.skip_confirmation!
    end
  end

  # TODO: Create This Test Later
  # describe '#set_reset_password_token' do
  #   it 'returns the plaintext token' do
  #     potential_token = subject.send(:set_reset_password_token)
  #     potential_token_digest = Devise.token_generator.digest(subject, :reset_password_token, potential_token)
  #     actual_token_digest = subject.reset_password_token
  #     expect(potential_token_digest).to eql(actual_token_digest)
  #   end
  # end

  protected
  def password_required?
    confirmed? ? super : false
  end

end
