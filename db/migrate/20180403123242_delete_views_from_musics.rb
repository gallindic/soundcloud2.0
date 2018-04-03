class DeleteViewsFromMusics < ActiveRecord::Migration
  def change
    remove_column :musics, :views
  end
end
