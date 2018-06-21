class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :website_url
      t.string :chrome_extension_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
