json.array!(@authors) do |author|
  json.extract! author, :id, :login, :ip
  json.url author_url(author, format: :json)
end
