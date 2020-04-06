class UpdateVotes < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :article_id, :integer
    change_column :votes, :user_id, :integer
  end
end
