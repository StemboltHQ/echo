class ChangeDateInQuotes < ActiveRecord::Migration
  def change

    remove_column :quotes, :date, :string
    add_column :quotes, :date, :datetime

  end
end
