#email = YAML.load_file("#{Rails.root}/config/credentials.yml")['email']

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "randomhost.com.br",
  :user_name            => "teste@randomhost.com.br",
  :password             => "wtflolwut",
  :authentication       => :plain,
  :enable_starttls_auto => true
}

