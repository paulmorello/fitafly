class AddCostToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :cost, :decimal
  end
end
