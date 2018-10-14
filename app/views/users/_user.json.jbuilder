json.extract! user, :id, :created_at, :updated_at
json.url all_users_url(user, format: :json)
