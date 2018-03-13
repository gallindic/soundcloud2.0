class MusicsController < ApplicationController
    def show
    end
    
    def new
        @music = Music.new
    end
    
    def create
        @music = Music.create(params[:music].permit(:title, :description, :file))
        @music.views = 0
        
        if @music.save
          redirect_to index_path, :notice => "A new list has been successfully created"  
        else
          render "new"
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
end
