class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.string :address
      t.date :dateInit
      t.date :dateEnd
      t.string :brand
      t.string :category
      t.string :user

      t.timestamps
    end
  end
end
