class AddColumnsToNames < ActiveRecord::Migration[5.2]
  def change
    add_column :names, :color_r, :integer, default: 0
    add_column :names, :color_g, :integer, default: 0
    add_column :names, :color_b, :integer, default: 0
  end
end
