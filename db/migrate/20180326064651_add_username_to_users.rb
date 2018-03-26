class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string #Adds a new column to the "Users" table called "username", type "string"
    add_index :users, :username, unique: true 
  end
end
