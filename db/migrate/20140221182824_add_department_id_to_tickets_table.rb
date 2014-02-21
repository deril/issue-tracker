class AddDepartmentIdToTicketsTable < ActiveRecord::Migration
  def change
    add_column :tickets, :department_id, :belongs_to
  end
end
