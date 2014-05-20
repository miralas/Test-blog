class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.decimal :rating
      t.references :category, index: true
      t.references :author, index: true

      t.timestamps
    end
  end
end
