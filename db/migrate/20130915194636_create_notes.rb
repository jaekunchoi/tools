class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :description
      t.belongs_to :ticket
      t.belongs_to :user
      t.timestamps
    end
    add_index :notes, :ticket_id
    add_index :notes, :user_id
  end
end
