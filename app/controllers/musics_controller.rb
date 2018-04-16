class MusicsController < ApplicationController
    before_action :find_music, except: [:new, :create]   #Pred vsem najprej izbede to funkcijo
    before_action :find_music_user, only: [:show, :destroy] #Ta funkcija je klicana samo za show funkcijo
    #except - Ta funkcija se ne izvede, ko kličemo funkcijo new
    impressionist actions: [:show], unique: [:session_hash] #Treba je met napisano, da gem dela
    
    def show
        #Poiščemo vse komentarje, ki pripadajo glasbi in jih razvrstimo po naraščujočem vrstnem redu
        @comments = Comment.where(music_id: @music.id).order(created_at: :asc)
        @comment = Comment.new  #Ustvarimo nov komentar
        
        impressionist(@music)   #Potrebno za impressionist gem, da deluje (glasovanje)

    end
    
    def new
        @music = current_user.musics.build
    end
    
    def create
        #V spremenjljivko shranimo vse podatke iz forma
        @music = current_user.musics.build(music_params)
        
        if @music.save
            #Glasbo shranimo v bazo in smo preusmerjeni na začetno stran
          redirect_to music_path(@music.id), :notice => "A new list has been successfully created"  
        else
            #V primeru, da se glasba ne shrani v bazo smo preusmerjeni na novo stran
          render "new"
        end
    end
    
    def edit
        @music = Music.find(params[:id])
    end
    
    def update
    end
    
    #Funkcija, ki se uporablja za glasovanje
    def upvote
        @music.upvote_from current_user
        
        redirect_to music_path(@music.id)
    end
    
    #Funkcija, ki se uporablja za glasovanje
    def downvote
        @music.downvote_from current_user
        
        redirect_to music_path(@music.id)
    end
    
    def destroy
        @music.destroy  #Iz baze zbrišemo glasbo in smo preusmerjeni na začetno stran
        redirect_to profile_path(@user), :notice => "Your list has been deleted"
    end
    
    private
    #Custom funkcije
    
    #Poiščemo uporabnika, ki je ustvaril glasbo
    #Ta funkcija se izvede samo za show funkcijo
    def find_music_user
        @user = User.find(@music.user_id)
    end
    
    #Poiščemo glasbo
    def find_music
        @music = Music.find(params[:id])
    end
    
    #Parametri, ki smo jih dobili iz dodaj glasbo forma
    def music_params
        params.require(:music).permit(:title, :description, :file, :image, :genre_id)
    end
end
