class UpdateColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :article_categories, :article_id
    add_column :article_categories, :article_id, :integer

    remove_column :article_categories, :category_id
    add_column :article_categories, :category_id, :integer

    remove_column :categories, :priority
    add_column :categories, :priority, :integer
  end
end
