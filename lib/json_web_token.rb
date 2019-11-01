require 'JWT'

class JsonWebToken
  class << self
    def encode(payload, expiration)
      payload[:exp] = expiration
      JWT.encode(payload, 'SECRET')
    end

    def decode(token)
      JWT.decode(token, 'SECRET')[0]
    rescue
      'FAILED'
    end
  end
end


# def encode(payload, exp = 24.hours.from_now)
#   payload[:exp] = exp.to_i
#   JWT.encode(payload, Rails.application.secrets.secret_key_base)
# end