class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.belongs_to :user

      t.timestamps
    end
    add_index :tickets, :user_id
  end
end
