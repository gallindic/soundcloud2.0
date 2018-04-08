class PagesController < ApplicationController
    def index
        
    end
    
    def profile
        @user = User.find(params[:id])
    end
    
    def settings
    end
    
    def explore
        @music = Music.all
        @genre = Genre.all
    end
end
