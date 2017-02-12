json.extract! thing, :id, :user_id, :type, :thing_type, :longtitude, :latitude, :description, :address, :created_at, :updated_at
json.url thing_url(thing, format: :json)