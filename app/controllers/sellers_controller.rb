class SellersController < ApplicationController
  before_action :seller, only: [:show, :edit, :update, :destroy]

  def index
  	@sellers = Seller.all
  end

  def show
  end

  def new
  	@seller = Seller.new
  end

  def create
  	@seller = Seller.new(seller_params)
  	if @seller.save
  		flash[:success] = "Seller with name #{@seller.name} created!"
  		redirect_to seller_path(@seller)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @seller.update(seller_params)
  		flash[:success] = "Seller with name #{@seller.name} updated!"
  		redirect_to seller_path(@seller)
  	else
  		render :edit
  	end
  end

  def destroy
  	seller_name = @seller.name
  	@seller.destroy
  	flash[:success] = "Seller with name: #{seller_name} destroyed. He gone!"
  	redirect_to sellers_path
  end

  private

  def seller_params  	
  	params.require(:seller).permit(:name, :email)
  end

  def seller
  	@seller = Seller.find(params[:id])
  end

end