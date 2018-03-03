class ReviewsController < ApplicationController

before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    else
      render :'products/show'
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])

    @review.destroy
    redirect_to product_path(@product)
  end


private

def review_params
  params.require(:review).permit(:rating, :description)
end

def require_login
  unless current_user
    flash[:error] = "You must be logged in to access this section"
    redirect_to login_url # halts request cycle
  end
end

end