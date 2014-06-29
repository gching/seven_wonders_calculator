class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :game_id
      t.string :name
      t.hstore :points
    end
  end
end
