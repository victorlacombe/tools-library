class RemoveLongDescriptionFromTools < ActiveRecord::Migration[5.2]
  def change
    remove_column :tools, :long_description, :string
  end
end
