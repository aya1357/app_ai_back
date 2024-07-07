create_table 'auth_providers', force: :cascade do |t|
  t.bigint :user_id
  t.string :provider
  t.string :uid

  t.timestamps null: false
end

add_index :auth_providers, :user_id
add_index :auth_providers, :uid, unique: true