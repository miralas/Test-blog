class AddIndexToRatingAndDate < ActiveRecord::Migration
  def change
  	add_index :articles, [:rating, :created_at]
  end
end
