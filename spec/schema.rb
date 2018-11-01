ActiveRecord::Schema.define do
  self.verbose = false

  create_table :visits, force: true do |t|
    t.datetime :start_at
    t.datetime :end_at
    t.integer :external_id
    t.decimal :sum, precision: 64, scale: 12

    t.timestamps
  end
end
