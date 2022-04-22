class AddTitleBodyToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :title, :string
    add_column :comments, :body, :string
  end
end
