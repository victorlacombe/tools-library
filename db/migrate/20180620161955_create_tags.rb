class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :tool, foreign_key: true

      t.timestamps
    end
  end
end
