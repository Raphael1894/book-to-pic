class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.integer :name
      t.integer :color_r, default: 0
      t.integer :color_g, default: 0
      t.integer :color_b, default: 0

      t.timestamps
    end
  end
end
