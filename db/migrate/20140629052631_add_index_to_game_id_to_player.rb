class AddIndexToGameIdToPlayer < ActiveRecord::Migration
  def change
    add_index :players, :game_id
  end
end
