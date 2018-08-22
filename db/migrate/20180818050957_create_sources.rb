class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.references :author, index: true, foreign_key: true
      t.references :sentence, index: true, foreign_key: true
      t.integer :category, index:true, null: false
      t.string :title, null: false
      t.string :kana, index: true, null: false
      t.timestamps
    end
  end
end
