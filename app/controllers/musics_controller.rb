class MusicsController < ApplicationController
    before_action :find_music, except: [:new]
    impressionist actions: [:show], unique: [:session_hash]
    
    def show
        @user = User.find(@music.user_id)
        
        @comments = Comment.where(music_id: @music.id).order(created_at: :desc)
        @comment = Comment.new
        
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
        @music.upvote_from current_user
        
        redirect_to music_path(@music.id)
    end
    
    def downvote
        @music.downvote_from current_user
        
        redirect_to music_path(@music.id)
    end
    
    def destroy
        @music.destroy
        redirect_to index_path, :notice => "Your list has been deleted"
    end
    
    private
    
    def find_music
        @music = Music.find(params[:id])
    end
    
    def music_params
        params.require(:music).permit(:title, :description, :file, :image, :genre_id)
    end
end
