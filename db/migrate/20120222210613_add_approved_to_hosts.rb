class AddApprovedToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :approved, :boolean, null: false, default: false
  end
end
