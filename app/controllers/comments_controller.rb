class CommentsController < ApplicationController
    before_action :find_music
    before_action :find_comment, only: [:destroy, :edit, :update]

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
    
    def edit
    end
    
    def update
        if @comment.update(params[:comment].permit(:content))
            redirect_to music_path(@music)
        else
            render "edit"
        end
    end
    
    def destroy
        @comment.destroy
        
        redirect_to music_path(@music)
    end
    
    
    private
    
    def find_music
        @music = Music.find(params[:music_id])
    end
    
    def find_comment
        @comment = Comment.find(params[:id])
    end
    
end
