json.extract! user, :id, :name, :icon, :user_id, :created_at, :updated_at
json.url user_url(user, format: :json)
