class AddUniqueConstraints < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :name, unique: true, name: 'uniq_username'
    add_index :users, :email, unique: true, name: 'uniq_email'
    add_index :categories, :name, unique: true, name: 'uniq_catname'
    add_index :categories, :priority, unique: true, name: 'uniq_catpriority'
  end
end
