class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :comments, dependent: :delete_all

	validates_presence_of :title
	validates_presence_of :content

end
