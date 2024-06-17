create_table 'moods', force: :cascade do |t|
  t.string :name, null: false

  t.timestamps null: false
end
