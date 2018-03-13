class AddFileToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :file, :string
  end
end
