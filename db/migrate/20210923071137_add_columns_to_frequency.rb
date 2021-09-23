class AddColumnsToFrequency < ActiveRecord::Migration[5.2]
  def change
    add_column :frequencies, :color_r, :integer, default: 0
    add_column :frequencies, :color_g, :integer, default: 0
    add_column :frequencies, :color_b, :integer, default: 0
  end
end
