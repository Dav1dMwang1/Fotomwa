class FotomwaMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer'
  default from: 'david.mwangi.john@gmail.com'
  default reply_to: 'david.mwangi.john@gmail.com'

  def confirmation_instructions(record, token, opts={})
    headers['Custom-header'] = 'Fotomwa'
    opts[:from] = 'david.mwangi.john@gmail.com'
    opts[:reply_to] = 'david.mwangi.john@gmail.com'
    # if record.invited?
    #   opts[:template_name] = 'invited_confirmation_instructions'
    # else
    #   opts[:template_name] = 'confirmation_instructions'
    # end
    super
  end

  def deliver_later
    Devise::Mailer.delay(queue: 'my_queue').send('...')
  end

end