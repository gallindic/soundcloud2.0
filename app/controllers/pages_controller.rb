class PagesController < ApplicationController
    before_action :find_user, only: [:profile]
    before_action :get_Music, only: [:index, :home]
    
    def index
        @popularMusic = Music.order(cached_votes_up: :desc).limit(5)
    end
    
    def home
        @music = Music.all
        @genre = Genre.all
    end
    
    def profile
        
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

end
