class CreateSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :sentences do |t|
      t.integer :term_id, null: false
      t.integer :source_id, null: false
      t.string :url, null: false
      t.text :body, null: false
      t.integer :favorite_count, default: 0, index: true

      t.timestamps
    end
    # reference型にし忘れた → foreign_key: trueでは外部キー制約にならない
    # 下記のようにすれば index: true は不要
    add_foreign_key :sentences, :terms
    add_foreign_key :sentences, :source
  end
end
