class MailerPreview < ActionMailer::Preview
  def confirmation_instructions
    FotomwaMailer.confirmation_instructions(User.first, "faketoken", {})
  end

  def reset_password_instructions
    FotomwaMailer.reset_password_instructions(User.first, "faketoken", {})
  end

  def unlock_instructions
    FotomwaMailer.unlock_instructions(User.first, "faketoken", {})
  end
end