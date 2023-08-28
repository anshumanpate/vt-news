class HomesController < ApplicationController
  def index
    if params[:search]
      @news = News.where("title LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @news = News.all
    end

  end
   def show
     debugger
   end
  
end
