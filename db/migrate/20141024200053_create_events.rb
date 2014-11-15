class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :image
      t.datetime :opening_date
      t.datetime :ending_date

      t.timestamps
    end
  end
end
