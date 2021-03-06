class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_starring_user, only: [:starred]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.name = params[:name]
    @contact.address = params[:address]
    @contact.user_id = session[:user_id]
    @contact.starred = params[:starred]
    respond_to do |format|
      if @contact.save
        format.html { redirect_to '/api/contact', notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      @contact.name = params[:name]
      @contact.user_id = session[:user_id]
      @contact.address = params[:address]
      @contact.starred = params[:starred]
      if @contact.save()
        format.html { redirect_to show_all_user_contacts_url, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to show_all_user_contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def starred
    if session[:user_id]
      @contacts = Contact.where(:user_id => session[:user_id]).where(:starred => true)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_starring_user
      @contacts = Contact.find_by(:user_id => session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.fetch(:contact, {})
    end
end
