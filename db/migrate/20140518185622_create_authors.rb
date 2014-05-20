class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :login
      t.string :ip

      t.timestamps
    end
  end
end
