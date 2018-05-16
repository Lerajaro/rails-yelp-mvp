class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]

    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render 'new'
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to articles_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
