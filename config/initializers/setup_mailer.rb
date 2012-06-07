#email = YAML.load_file("#{Rails.root}/config/credentials.yml")['email']
email['domain']   = "randomhost.com.br"
email['user']     = "teste@randomhost.com.br"
email['password'] = "wtflolwut"

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => email['domain'],
  :user_name            => email['user'],
  :password             => email['password'],
  :authentication       => :plain,
  :enable_starttls_auto => true
}

