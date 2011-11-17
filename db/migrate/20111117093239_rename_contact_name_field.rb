class RenameContactNameField < ActiveRecord::Migration
  def up
  	rename_column :clients, :contact_name, :first_name
  end

  def down
  end
end
