json.extract! photo, :id, :price, :title, :description, :url, :created_at, :updated_at
json.url photo_url(photo, format: :json)
