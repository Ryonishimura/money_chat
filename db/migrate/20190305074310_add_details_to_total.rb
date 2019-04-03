class AddDetailsToTotal < ActiveRecord::Migration[5.2]
  def change
    add_column :totals, :total_price, :integer
  end
end
