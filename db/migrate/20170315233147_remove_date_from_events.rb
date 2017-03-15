class RemoveDateFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :date, :string
  end
end
