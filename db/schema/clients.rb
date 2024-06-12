create_table 'clients', force: :cascade do |t|
  t.bigint :company_id
  t.bigint :department_id
  t.string :name, null: false

  t.timestamps null: false
end

add_index :clients, :company_id
add_index :clients, :department_id