# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
categories = [
  {title: 'Cars'},
  {title: 'Computers'},
  {title: 'Medicine'},
  {title: 'Military'}, 
  {title: 'Sport'}
]
puts "Default categories: "
Category.create(categories).each do |category|
  if category.save
    puts "#{category.id} - #{category.title}"
  else
    puts '>>> Category not created!'
  end
end

Author.delete_all
rand(200..800).times do
  author = Author.create({
          login: ('a'..'z').to_a.shuffle.first(rand(5..9)).join,
          ip: "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"})
  puts '>>> Author not created!' unless author.save
end
puts "#{Author.count} authors succesfully created!"

Article.delete_all
puts "Default articles: "
rand(3_000..4_000).times do
  article = Article.create({
          title: ['Mersedes', 'Audi', 'Apple', 'Acer', 'Health', 'Battle-Tank', 'Basketbal'].sample,
          content: ['The best or nothing', 'Nice car', 'Best computers', 'Good computers', 'Devastating power', 'Active sport'].sample,
          category: Category.all.sample,
          rating: 0.0,
          author: Author.all.sample,
          created_at: rand(6.months.ago..Time.now) })
  puts '>>> Article not created!' unless article.save
end
puts "#{Article.count} articles succesfully created!"

Comment.delete_all
puts "Default comments: "
rand(4_000..5_000).times do
  comment = Comment.create({
                article: Article.all.sample,
                content: ('a'..'z').to_a.shuffle.first(rand(40..100)).join,
                mark: rand(1..5),
                author: Author.all.sample,
                created_at: rand(6.months.ago..Time.now) })
  puts '>>> Comment not created!' unless comment.save
end
puts "#{Comment.count} comments succesfully created!"