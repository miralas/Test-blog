class AddIndexToLogin < ActiveRecord::Migration
  def change
  	add_index :authors, :login
  end
end
