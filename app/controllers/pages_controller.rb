class PagesController < ApplicationController
    def index
        @music = Music.all
        @genre = Genre.all
    end
    
    def profile
        @user = User.find(params[:id])
    end
    
    def settings
    end
    
    def explore
    end
end
