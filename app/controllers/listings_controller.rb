class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ update ]
  def new
    @listing = current_user.listings.new
  end

  def edit
    @user = current_user
    @listing = @user.listings.find(params[:id])
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to user_path(current_user), notice: 'Listing was created successfully'
    else
      render :new
    end
  end

  def update
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
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:title, :description, :zipcode, :price)
    end
end
