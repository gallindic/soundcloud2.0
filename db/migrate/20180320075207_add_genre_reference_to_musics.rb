class AddGenreReferenceToMusics < ActiveRecord::Migration
  def change
    add_reference :musics, :genre, index: true, foreign_key: true
  end
end
