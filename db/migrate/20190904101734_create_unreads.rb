class CreateUnreads < ActiveRecord::Migration[5.2]
  def change
    create_table :unreads do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
