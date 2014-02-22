class AddManagerIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :manager_id, :belogns_to
  end
end
