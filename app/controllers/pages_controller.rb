class PagesController < ApplicationController
    def index
        @music = Music.all
    end
    
    def profile
    end
    
    def settings
    end
end
