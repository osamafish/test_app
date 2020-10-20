# json.extract! articale, :id, :title, :string, :description, :created_at, :updated_at
json.extract! articale, :id, :title, :userName, :description, :created_at, :updated_at
json.url articale_url(articale, format: :json)
