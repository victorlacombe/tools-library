class AddLongDescriptionToTool < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :long_description, :text
  end
end
