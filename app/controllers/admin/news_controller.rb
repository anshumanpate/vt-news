class Admin::NewsController < ApplicationController
  before_action :authenticate_user!
 before_action :check_admin_and_editor_roles
    before_action :set_news, only: [:show, :edit, :update, :destroy]
  
    def index
      @news = News.all
     
      # render json: @news, methods: [:image_urls]
    end
  
    def new
      @news = News.new
    end
  
    def create
      
      @news = News.create(news_params)
  
      
        redirect_to admin_news_index_path, notice: 'News was successfully created.'
      
     
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @news.update(news_params)
        redirect_to admin_news_index_path, notice: 'News was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @news.destroy
      redirect_to admin_news_index_path, notice: 'News was successfully destroyed.'
    end
  
    private
  
    def set_news
      @news = News.find(params[:id])
    end
  
    def news_params
      params.require(:news).permit(:title, :headlines, :short_description, :description,:state_id ,:city_id ,:category_id, images: [] , videos: [])
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
