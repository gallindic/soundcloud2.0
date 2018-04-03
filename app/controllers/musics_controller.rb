class MusicsController < ApplicationController
    
    impressionist actions: [:show], unique: [:session_hash]
    
    def show
        @music = Music.find(params[:id])
        
        @user = User.find(@music.user_id)
        
        @comments = Comment.where(music_id: @music.id).order("created_at DESC")
        
        impressionist(@music)
    end
    
    def new
        @music = current_user.musics.build
    end
    
    def create
        @music = current_user.musics.build(music_params)
        
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
    
    def upvote
        @music = Music.find(params[:id])
        @music.upvote_from current_user
        
        redirect_to music_path(@music.id)
    end
    
    def downvote
        @music = Music.find(params[:id])
        @music.downvote_from current_user
        
        redirect_to music_path(@music.id)
    end
    
    def destroy
        @music = Music.find(params[:id])
        @music.destroy
        redirect_to index_path, :notice => "Your list has been deleted"
    end
    
    private
    def music_params
        params.require(:music).permit(:title, :description, :file, :image, :genre_id)
    end
end
