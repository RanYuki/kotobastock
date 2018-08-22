class CreateConceptSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :concept_sentences do |t|
      t.references :concept, index: true, foreign_key: true
      t.references :sentence, index: true, foreign_key: true
      t.timestamps
    end
    add_index :concept_sentences,[:concept_id, :sentences_id], unique: true
  end
end
