class ApplicationMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def contact_message(message)
    @message = message
    mail(:to => "a.andremr@gmail.com", :subject => "Mensagem de: #{message[:name]}")
  end
  
end
