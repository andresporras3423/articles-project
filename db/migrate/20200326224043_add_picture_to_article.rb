class AddPictureToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :picture, :string
  end
end
