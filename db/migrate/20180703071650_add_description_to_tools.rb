class AddDescriptionToTools < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :description, :string
  end
end
