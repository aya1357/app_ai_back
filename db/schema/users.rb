create_table 'users', force: :cascade do |t|
  t.bigint :company_id
  t.bigint :department_id
  t.bigint :client_id
  t.string :job_status, null: false

  t.string :name, null: false
  t.string :name_kana, null: false

  ## Database authenticatable
  t.string :email, null: false, default: ''
  t.string :encrypted_password, null: false, default: ''

  ## Recoverable
  t.string   :reset_password_token
  t.datetime :reset_password_sent_at

  t.timestamps null: false
end

add_index :users, :company_id
add_index :users, :department_id
add_index :users, :client_id
add_index :users, :email, unique: true
add_index :users, :reset_password_token, unique: true
