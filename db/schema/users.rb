create_table 'users', force: :cascade do |t|
  t.bigint :company_id
  t.bigint :department_id
  t.bigint :client_id

  t.string :name, null: false
  t.string :name_kana
  t.string :avatar

  ## Database authenticatable
  t.string :email, null: false, default: ''

  t.timestamps null: false
end

add_index :users, :company_id
add_index :users, :department_id
add_index :users, :client_id
add_index :users, :email, unique: true
