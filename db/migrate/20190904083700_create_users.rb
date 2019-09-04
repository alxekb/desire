class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login, uniqueness: true
      t.string :password
      t.text :signature
      t.string :name, null: false

      t.timestamps
    end

    # Create a table with Post
    create_table :posts do |t|
      t.string :title
      t.text :notice
      t.string :content
      t.boolean :published
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
