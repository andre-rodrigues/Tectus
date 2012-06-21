class ApplicationMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def contact_message(message)
    @message = message
    mail(:to => "contato@tectus.arq.br", :subject => "Mensagem de: #{message[:name]}")
  end
  
end
