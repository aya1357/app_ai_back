create_table 'companies', force: :cascade do |t|
  t.string :name, null: false
  t.string :type, null: false

  t.timestamps null: false
end
