class UpdateUserOfArticle < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :user_id, :integer
  end
end
