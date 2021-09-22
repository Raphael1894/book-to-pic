class CreateFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :frequencies do |t|
      t.string :word
      t.bigint :count
      t.bigint :rank

      t.timestamps
    end
  end
end
