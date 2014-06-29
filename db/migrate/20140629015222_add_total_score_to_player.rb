class AddTotalScoreToPlayer < ActiveRecord::Migration
  def up
    add_column :players, :score, :integer
  end

  def down
    remove_column :players, :score
  end
end
