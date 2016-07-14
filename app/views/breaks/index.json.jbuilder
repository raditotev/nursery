json.array!(@breaks) do |break|
  json.extract! break, :id, :start_date, :end_date, :description
  json.url break_url(break, format: :json)
end
