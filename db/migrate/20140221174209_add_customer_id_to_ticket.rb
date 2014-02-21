class AddCustomerIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :customer_id, :belongs_to
  end
end
