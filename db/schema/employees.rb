create_table 'employees', force: :cascade do |t|
  t.bigint :company_id
  t.bigint :department_id
  t.string :name, null: false

  t.timestamps null: false
end

add_index :employees, :company_id
add_index :employees, :department_id