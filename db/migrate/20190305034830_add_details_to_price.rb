class AddDetailsToPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :prices, :amount, :integer
    add_reference :prices, :user, foreign_key: true
    add_reference :prices, :room, foreign_key: true
  end
end
