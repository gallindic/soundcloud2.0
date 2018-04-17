class UsersController < ApplicationController
    before_action :find_user
    before_action :user_status, only: [:update]
    
    def edit
    end
    
    def update
        if @user.update(user_status)
            redirect_to profile_path(current_user.id)
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to profile_path(current_user.id)
        end
    end
    
    
    
    private
    
    def find_user
        @user = User.find(params[:id])
    end
    
    def user_status
        params.require(:user).permit(:admin)
    end
end
