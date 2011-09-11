# encoding: UTF-8
class ContactController < ApplicationController
  
  def index
    @page_title = 'Envie sua Mensagem'
  end

  def create
    @message = params[:contact]

    if @message['name'].blank? or @message['email'].blank? or @message['city'].blank? or @message['phone'].blank?
      @error_message = "Todos os campos devem ser preenchidos."
    else
      ApplicationMailer.contact_message(@message).deliver
    end
    
    respond_to do |format|
      format.js
    end
  end
  
end
