class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.bigint :posts_counter, default: 0
      t.timestamps
    end
  end
end
