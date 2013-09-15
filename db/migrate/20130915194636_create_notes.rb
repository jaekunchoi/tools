class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :description
      t.belongs_to :ticket

      t.timestamps
    end
  end
end
