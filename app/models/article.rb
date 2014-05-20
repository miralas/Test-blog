class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :comments, dependent: :delete_all
end
