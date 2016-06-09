class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year_published
      t.string :genre
      t.boolean :available
      t.string :image

      t.timestamps
    end
  end
end
