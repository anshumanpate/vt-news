class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_and_editor_roles
    
  

    def index
      @categories = Category.all
      # render json: @categories
      
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

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_category_path(@category), notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    def edit
      # debugger
      @category = Category.find(params[:id])
      

    end

    def update
     
      
              

      @category = Category.find(params[:id])

         @category.update(category_params)

        redirect_to admin_categories_path, notice: 'Category was successfully updated.'
     
    end

    def destroy
      @category = Category.find(params[:id])

      @category.destroy
      redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
    end

    private


    def category_params
      params.require(:category).permit(:name)
    end


    def check_admin_and_editor_roles
      check_role
    end
  def check_role
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: "You are not authorized to access the editor panel."
    end
  end
end
