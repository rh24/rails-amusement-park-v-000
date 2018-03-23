class RenameColumnToTicketsInAttractions < ActiveRecord::Migration
  def change
    rename_column :attractions, :ticket_number, :tickets
  end
end
