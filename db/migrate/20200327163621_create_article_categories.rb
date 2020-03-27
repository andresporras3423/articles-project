class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.string :article_id
      t.string :category_id

      t.timestamps
    end
  end
end
