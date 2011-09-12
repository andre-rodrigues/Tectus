class ApplicationMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def contact_message(message)
    @message = message
    mail(:to => "andremartins_r@hotmail.com", :subject => "Mensagem de: #{message[:name]}")
  end
  
end
