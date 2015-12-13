class RenameAndChangeTypeOfApproved < ActiveRecord::Migration
  def change
  	rename_column :applications, :approved, :status
  	change_column :applications, :status, :string
  end
end
