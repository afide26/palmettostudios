class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Your message has been recorded. We will get back to you shortly."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:danger] = "Contact deleted"
    redirect_to contacts_path
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :body)
    end
end
