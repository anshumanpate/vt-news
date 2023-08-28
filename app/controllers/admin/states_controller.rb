class Admin::StatesController < ApplicationController
  before_action :authenticate_user!
 before_action :check_admin_and_editor_roles
   
  
      def index
        @states = State.all
      end
  
      def show
        @state = State.find(params[:id])
      end
  
      def new
        @state = State.new
      end
  
      def create
        @state = State.new(state_params)
        if @state.save
          redirect_to admin_state_path(@state), notice: 'State was successfully created.'
        else
          render :new
        end
      end
  
      def edit
        @state = State.find(params[:id])
      end
  
      def update
        @state = State.find(params[:id])
        if @state.update(state_params)
          redirect_to admin_state_path(@state), notice: 'State was successfully updated.'
        else
          render :edit
        end
      end
  
      def destroy
        @state = State.find(params[:id])
        @state.destroy
        redirect_to admin_states_path, notice: 'State was successfully destroyed.'
      end
  
      private
  
      def state_params
        params.require(:state).permit(:name)
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
