class AddColumnsToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :color_r, :integer, default: 0
    add_column :texts, :color_g, :integer, default: 0
    add_column :texts, :color_b, :integer, default: 0
  end
end
