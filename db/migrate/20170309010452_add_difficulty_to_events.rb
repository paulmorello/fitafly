class AddDifficultyToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :difficulty, :string
  end
end
