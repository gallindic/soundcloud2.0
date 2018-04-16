class PagesController < ApplicationController
    before_action :find_user, only: [:profile]
    before_action :get_Music, only: [:index, :home]
    before_action :find_all_users, only: [:profile]
    
    def index
        @popularMusic = Music.order(cached_votes_up: :desc).limit(5)
    end
    
    def home
        @genre = Genre.all
    end
    
    def profile
        @user_music = Music.where("user_id = ?", @user.id)
        @numUserPost = Music.where("user_id = ?", @user.id).count
        
       
    end
    
    def show
        
    end
    
    def settings
    end
    
    def explore
        
    end
    
    
    
    
    
    private
    
    def get_Music
        @music = Music.all
    end
    
    def find_user
        @user = User.find(params[:id])
    end
    
    def find_all_users
        @users = User.all
    end

end
