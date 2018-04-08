class Genre < ActiveRecord::Base
    has_many :musics    #Ima nič ali več glasb (otrok)
end
