class CommentsController < ApplicationController
    before_action :find_music
    before_action :find_comment, only: [:destroy, :edit, :update]


    def new
        @comment = Comment.new
    end

    def create
        @comment = @music.comments.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
        @comment.save
        
        respond_to do |format|
           if @comment.save
            format.html { redirect_to music_path(@music), notice: "Comment was successfully made" }
            format.json { render :_comments, status: :created, location: @comment }
            format.js {render layout: false}
           else
            format.html { render "new" }
            format.json { render json: @comment.errors, status: :unprocessable__entity }
            format.js {render layout: false}
           end
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
