class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contacts = Contact.all
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
      render :index
  end 
  
  def contact_params
    params.require(:contact)
          .permit(:email,
                  :name,
                  :phone_number,
                  :message,
                  :contact_status,
                 )
                 
  end
  
end
