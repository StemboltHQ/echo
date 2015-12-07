class AddUserReferencesToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :user, index: true, foreign_key: true
    remove_column :quotes, :supplier, :string
  end
end
