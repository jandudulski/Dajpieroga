class AddFacebookFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end
