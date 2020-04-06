class UniqManyToMany < ActiveRecord::Migration[6.0]
  def change
    add_index :votes, [:user_id, :article_id], :unique => true
    add_index :article_categories, [:category_id, :article_id], :unique => true
  end
end
