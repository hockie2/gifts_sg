class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|

    	t.references :item_id
    	t.references :user_id

      t.timestamps
    end
  end
end
