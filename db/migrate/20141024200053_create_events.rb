class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :image
      t.date :opening_date
      t.date :ending_date

      t.timestamps
    end
  end
end
