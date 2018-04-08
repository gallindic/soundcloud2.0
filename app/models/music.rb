class Music < ActiveRecord::Base
    belongs_to :user    #Model User je starš tega modela
    belongs_to :genre   #Model Genre je starš tega modela
    #dependent - če je starš izbrisan iz baze bodo še otroci
    has_many :comments, dependent: :destroy #Ima nič ali več komentarjev (otrok)
    
    #Potrebno za carrierwave gem (dodajanje datotek)
    mount_uploader :file, FileUploader
    mount_uploader :image, FileUploader
    
    #Potrebno za acts_as_votable gem
    #Pove, da je model music tisti, ki je glasovan (prejema glasove)
    acts_as_votable #Ni več v uporabi
    
    #Potrebno za impresionist gem
    #Uporablja se za glasovanje (like, unlike)
    is_impressionable
end
