json.extract! sentence, :id, :term_id, :concept_id, :source_id, :source_author_id, :url, :body, :favorite_count, :created_at, :updated_at
json.url sentence_url(sentence, format: :json)
