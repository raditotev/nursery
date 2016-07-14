json.array!(@testemonials) do |testemonial|
  json.extract! testemonial, :id, :title, :description
  json.url testemonial_url(testemonial, format: :json)
end
