class CreateMatrices < ActiveRecord::Migration[5.2]
  def change
    create_table :matrices do |t|
      t.string :mat

      t.timestamps
    end
  end
end
