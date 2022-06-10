class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :Author, index: true, foreign_key: {to_table: :users}
      t.references :Post, index: true, foreign_key: {to_table: :posts}
      t.text :Text
      t.timestamps
    end
  end
end
