class AddUserToNotes < ActiveRecord::Migration[5.1]
  def change
    change_table :notes do |t|
      t.references :user, index: true
    end
  end
end
