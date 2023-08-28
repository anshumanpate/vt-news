class Admin::CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_and_editor_roles
    
      before_action :set_city, only: [:show, :edit, :update, :destroy]
  
      def index
        @cities = City.all
      end
  
      def show
      end
  
      def new
         
        
        # Get the associated state
         @city = State.find(params[:state_id]).cities.build
      end
  
      def create
        
        @city = City.new(city_params)
        if @city.save
          redirect_to admin_state_city_path(@city.state, @city), notice: 'City was successfully created.'
        else
          render :new
        end
      end
  
     
     
  
      def destroy
        
        @city.destroy
        redirect_to admin_state_cities_path, notice: 'City was successfully destroyed.'
      end
  
      private
  
      def set_city
        @city = City.find(params[:id])
      end
  
      def city_params
        params.require(:city).permit(:name , :state_id)
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
  