create_table 'posts', force: :cascade do |t|
  t.bigint :user_id
  t.text :text, null: false
  t.integer :word_count
  t.string :sns, null: false

  t.timestamps
end

add_index :posts, :user_id