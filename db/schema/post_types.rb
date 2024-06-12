create_table 'post_types', force: :cascade do |t|
  t.bigint :post_id, null: false
  t.bigint :type_id, null: false

  t.timestamps null: false
end

add_index :post_types, :post_id
add_index :post_types, :type_id