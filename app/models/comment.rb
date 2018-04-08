class Comment < ActiveRecord::Base
  belongs_to :user  #Model User je starš tega modela
  belongs_to :music #Model Music je starš tega modela
end
