class ChangePictureLimitPictures < ActiveRecord::Migration
  def up
    change_column :pictures, :picture, :binary, :limit => 16.megabyte
  end
end
