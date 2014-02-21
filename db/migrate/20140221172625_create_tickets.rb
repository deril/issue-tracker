class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets, id: false do |t|
      t.string :id, null: false
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
