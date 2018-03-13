class CreateMusicsTable < ActiveRecord::Migration
  def change
    create_table :musics_tables do |t|
      t.string :title
      t.integer :views
    end
  end
end
