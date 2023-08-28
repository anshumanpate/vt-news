class Editor::NewsController < ApplicationController
  before_action :authenticate_user!
 before_action :check_admin_and_editor_roles
  
  def index
   
    @news = News.all
   
  end

  def new
    @news = News.new
  end

  def create
    
    @news = News.create(news_params)

    
      redirect_to editor_news_index_path, notice: 'News was successfully created.'
    
   
  end

  def show
    @news = News.find(params[:id])

  end

  def edit
    @news = News.find(params[:id])

  end

  def update
    if @news.update(news_params)
      redirect_to editor_news_index_path, notice: 'News was successfully updated.'
    else
      render :edit
    end
  end



  def news_params
    params.require(:news).permit(:title, :headlines, :short_description, :description,:state_id ,:city_id ,:category_id, images: [])
  end
 
  def check_admin_and_editor_roles
    check_role
  end
def check_role
    unless current_user.has_role?(:editor)
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end



 
end
