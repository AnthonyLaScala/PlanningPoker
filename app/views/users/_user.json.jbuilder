json.extract! user, :id, :name, :vote, :created_at, :updated_at
json.url user_url(user, format: :json)