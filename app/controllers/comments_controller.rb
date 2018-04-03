class CommentsController < ApplicationController
    before_action :find_music

    def create
        @comment = @music.comments.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
        @comment.save
        
        if @comment.save
            redirect_to music_path(@music)
        else
            render "new"
        end
    end
    
    
    private
    
    def find_music
        @music = Music.find(params[:music_id])
    end
end
