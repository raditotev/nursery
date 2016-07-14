json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :name, :url
  json.url newsletter_url(newsletter, format: :json)
end
