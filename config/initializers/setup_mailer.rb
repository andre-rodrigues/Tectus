#email = YAML.load_file("#{Rails.root}/config/credentials.yml")['email']

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => ENV['SMTP_DOMAIN'],
  :user_name            => ENV['SMTP_USER'],
  :password             => ENV['SMTP_PASS'],
  :authentication       => :plain,
  :enable_starttls_auto => true
}

