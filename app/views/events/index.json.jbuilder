json.array!(@events) do |event|
  json.extract! event, :id, :start_date, :end_date, :description
  json.url event_url(event, format: :json)
end
