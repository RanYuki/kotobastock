class CreateFolderSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :folder_sentences do |t|
      t.references :folder_id, index: true, foreign_key: true
      t.references :sentence_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
