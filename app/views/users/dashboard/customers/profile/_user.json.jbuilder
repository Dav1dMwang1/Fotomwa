json.extract! user, [ :id, :name ]
json.url user_profile_url(user, format: :json)
