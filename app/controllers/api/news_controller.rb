class Api::NewsController < ApplicationController

     def index
      @news = News.all
     
      render json: @news, methods: [:image_urls]
    end

    def show
      @news = News.find(params[:id])
      render json: @news, methods: [:image_urls]


    end
 
end
