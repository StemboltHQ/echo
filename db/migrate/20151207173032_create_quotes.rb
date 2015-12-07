class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author
      t.string :supplier
      t.text :body
      t.string :date
      t.string :location

      t.timestamps null: false
    end
  end
end
