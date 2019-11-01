json.extract! model, :id, :name, :slug, :model_range_id, :created_at, :updated_at
json.url model_url(model, format: :json)
