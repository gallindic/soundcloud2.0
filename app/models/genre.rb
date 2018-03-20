class Genre < ActiveRecord::Base
    has_many :musics
end
