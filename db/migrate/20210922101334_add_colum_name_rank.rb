class AddColumNameRank < ActiveRecord::Migration[5.2]
  def change
    add_column :names, :rank, :bigint
  end
end
