class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :user_name
      t.string :picture
      t.string :caption
      t.datetime :sent_date

      t.timestamps
    end
  end
end
