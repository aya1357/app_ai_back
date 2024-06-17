create_table 'post_moods', force: :cascade do |t|
  t.bigint :post_id, null: false
  t.bigint :mood_id, null: false

  t.timestamps null: false
end

add_index :post_moods, :post_id
add_index :post_moods, :mood_id