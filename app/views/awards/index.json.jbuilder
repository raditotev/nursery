json.array!(@awards) do |award|
  json.extract! award, :id, :title, :description
  json.url award_url(award, format: :json)
end
