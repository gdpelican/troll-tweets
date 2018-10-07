class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.string :key, null: false
      t.jsonb  :value, default: {}, null: false
      t.string :query
    end
  end
end
