class Comment < ActiveRecord::Base
	belongs_to :author
	belongs_to :article, touch: true

	validates_presence_of :content
	validates_presence_of :mark

  after_validation on: :create do
		rating = Comment.where(article_id: article.id).average(:mark)
		article.rating = rating if rating
		article.save
  end

end
