class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.string :word, null: false
      t.string :kana, index: true, null: false

      t.timestamps
    end
  end
end
