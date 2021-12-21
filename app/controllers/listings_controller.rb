class ListingsController < ApplicationController
  def index
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = current_user.listings.new
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to(root_path, notice: 'Listing was created successfully')
    else
      render :new
    end
  end

  def update
    @listing = current_user.listings.find(params[:id])

    if @listing.update(listing_params)
      redirect_to user_path(current_user), notice: "Listing was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @listing = current_user.listings.find(params[:id])
    @listing.destroy
    redirect_to user_path(current_user), notice: "Listing was deleted"
  end

  private
    def listing_params
      params.require(:listing).permit(:title, :description, :zipcode, :price)
    end
end
