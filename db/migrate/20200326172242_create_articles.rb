class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :user_id
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
