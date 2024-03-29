class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :mark
      t.references :author, index: true
      t.references :article, index: true

      t.timestamps
    end
  end
end
