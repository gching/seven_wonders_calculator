class AddTimestampToPlayer < ActiveRecord::Migration
  def change
    change_table(:players) { |t| t.timestamps }
  end
end
