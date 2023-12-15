json.extract! room, :id, :room_code, :description, :price_per_nigth, :hotel_id, :created_at, :updated_at
json.url room_url(room, format: :json)
