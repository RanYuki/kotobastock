json.extract! comment, :id, :contact_id, :title, :body, :created_at, :updated_at
json.url comment_url(comment, format: :json)
