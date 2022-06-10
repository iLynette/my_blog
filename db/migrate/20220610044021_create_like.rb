class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :Author, index: true, foreign_key: {to_table: :user}
      t.references :Post, index: true, foreign_key: {to_table: :post}
      t.timestamps
    end
  end
end
