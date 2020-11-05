class ChangeDatatypeTextOfComments < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :text, :text
  end
end
