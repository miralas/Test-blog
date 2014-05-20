class Author < ActiveRecord::Base
	has_many :articles
	has_many :comments

	validates_presence_of :login
	validates_presence_of :ip

end
