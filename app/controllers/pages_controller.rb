class PagesController < ApplicationController
    before_action :find_user, only: [:profile]
    
    
    def index
        
    end
    
    def profile
        
    end
    
    def settings
    end
    
    def explore
        @music = Music.all
        @genre = Genre.all
    end
    
    private
    
    def find_user
        @user = User.find(params[:id])
    end

end
