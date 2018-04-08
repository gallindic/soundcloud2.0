class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
         
  #dependent - če je starš izbrisan iz baze bodo še otroci
  has_many :musics, dependent: :destroy #Ima nič ali več komentarjev (otrok)
  has_many :comments, dependent: :destroy #Ima nič ali več komentarjev (otrok)
  
  #Potrebno za carrierwave gem (dodajanje datotek)
  mount_uploader :image, FileUploader
  
  #Potrebno za acts_as_votable gem
  #Pove, da je model user tisti, ki glasuje (dodaja glasove)
  acts_as_voter  #Ni več v uporabi
end
