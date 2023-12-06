class Dropchatroom < ActiveRecord::Migration[7.0]
  def change
    drop_table :chatrooms
  end
end
