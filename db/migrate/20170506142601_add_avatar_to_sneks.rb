class AddAvatarToSneks < ActiveRecord::Migration[5.1]
  def change
    add_column :sneks, :avatar, :string
  end
end
