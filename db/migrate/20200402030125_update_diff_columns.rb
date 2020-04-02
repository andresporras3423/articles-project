class UpdateDiffColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :article_id
    add_column :votes, :article_id, :integer
    remove_column :votes, :user_id
    add_column :votes, :user_id, :integer
    remove_column :articles, :user_id
    add_column :articles, :user_id, :integer
  end
end
