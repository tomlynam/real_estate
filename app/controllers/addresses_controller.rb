class AddressesController < ApplicationController
  before_action :address, only: [:show, :edit, :update, :destroy]
  before_action :home, only: [:update, :show, :destroy]
  before_action :seller, only: [:update, :show, :destroy]

  def index
  	redirect_to sellers_path
  end

  def show
  end

  def new
  	@home = Home.find(params[:home_id])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @home = @address.home
    @seller = @home.seller
  	if @address.save
  		flash[:success] = "Address re: #{@address.street} created!"
  		redirect_to seller_home_path(@seller, @home)
  	else
  		render :new
  	end
  end

  def edit
    @home = Home.find(@address.home_id)
  end

  def update
  	if @address.update(address_params)
  		flash[:success] = "Address re: in #{@address.street} updated!"
  		redirect_to address_path(@address)
  	else
  		render :edit
  	end
  end

  def destroy
  	empty_lot = @address.street
  	@address.destroy
  	flash[:success] = "Address re: #{empty_lot} destroyed!"
    redirect_to seller_home_path(@seller, @home)
  end

  private

  def address_params
  	params.require(:address).permit(:street, :city, :state, :zip, :home_id)
  end

  def address
  	@address = Address.find(params[:id])
  end

  def home
  	@home = Home.find(@address.home_id)
  end

  def seller
    @seller = Seller.find(@home.seller_id)
  end

end