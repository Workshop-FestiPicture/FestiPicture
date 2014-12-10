class ChangePictureFormatInPictures < ActiveRecord::Migration
  def up
    change_column :pictures, :picture, :binary
  end

  def down
    change_column :pictures, :picture, :string
  end
end
