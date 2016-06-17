class AddCurrentPrice < ActiveRecord::Migration
  def change
    add_column :trades, :current_price, :decimal
  end
end
