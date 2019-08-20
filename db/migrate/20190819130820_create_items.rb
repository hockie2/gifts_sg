class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.file :public_id
      t.text :description
      t.boolean :preloved, default: true
      t.text :availability, default: "Available"

      t.timestamps
    end
  end
end
