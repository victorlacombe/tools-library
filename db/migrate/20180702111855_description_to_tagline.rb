class DescriptionToTagline < ActiveRecord::Migration[5.2]
  def change
    rename_column :tools, :description, :tagline
  end
end
