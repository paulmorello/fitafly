class AddAdditionalInformationToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :additional_information, :string
  end
end
