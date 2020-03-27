class UpdateColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :article_categories, :article_id, :integer
    change_column :article_categories, :category_id, :integer
    change_column :categories, :priority, :integer
  end
end
