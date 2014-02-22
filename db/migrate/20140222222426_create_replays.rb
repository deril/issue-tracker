class CreateReplays < ActiveRecord::Migration
  def change
    create_table :replays do |t|
      t.belongs_to :ticket, index: true
      t.belongs_to :manager, index: true
      t.text :body

      t.timestamps
    end
  end
end
