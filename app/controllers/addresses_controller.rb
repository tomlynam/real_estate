class AddressesController < ApplicationController
  before_action :home
  before_action :address, only: [:show, :edit, :update, :destroy]

  def index
  	@addresses = Address.all
  end

  def show
  end

  def new
  	@address = Address.new
  end

  def create
  	@address = @home.addresses.new(address_params)
  	if @address.save
  		flash[:success] = "Address re: #{@address.street} created!"
  		redirect_to address_path(id: @address.id, home_id: @home.id)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @address.update(address_params)
  		flash[:success] = "Address re: in #{@address} updated!"
  		redirect_to address_path(@address)
  	else
  		render :edit
  	end
  end

  def destroy
  	empty_lot = @address.street
  	@address.destroy
  	flash[:success] = "Address re: #{empty_lot} destroyed!"
  	redirect_to addresses_path
  end

  private

  def address_params
  	params.require(:address).permit(:street, :city, :state, :zip, :home_id)
  end

  def address
  	@address = Address.find(params[:id])
  end

  def home
  	@home = Home.find(params[:home_id])
  end

end