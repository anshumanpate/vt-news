class Api::CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
    render json: @categories
    
  end

  def show
    @category = Category.find(params[:id]).news
    render json: @category , methods: [:image_urls]


  end
  def news
    category = Category.find(params[:category_id])
    news = category.news.find(params[:news_id])

    render json: news
  end
end
