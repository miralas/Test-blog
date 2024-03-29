json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :rating, :category_id, :author_id
  json.url article_url(article, format: :json)
end
