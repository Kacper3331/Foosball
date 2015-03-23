class RenameUsersToPlayers < ActiveRecord::Migration
  def self.up
    rename_table :users, :players
  end
  
  def self.down
    rename_table :players, :users
  end
end
