class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :Photo
      t.string :Bio
      t.bigint :PostsCounter
      t.timestamps
    end
  end
end
