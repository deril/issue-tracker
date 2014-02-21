class AddStatusIdToTicketsTable < ActiveRecord::Migration
  def change
    add_column :tickets, :status_id, :belongs_to
  end
end
