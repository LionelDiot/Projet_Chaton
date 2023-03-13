json.extract! user, :id, :encrypted_password, :email, :first_name, :last_name, :cart_id, :created_at, :updated_at
json.url user_url(user, format: :json)
