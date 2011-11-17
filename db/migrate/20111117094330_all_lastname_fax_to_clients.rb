class AllLastnameFaxToClients < ActiveRecord::Migration
  def up
  	add_column :clients, :last_name, :string
  	add_column :clients, :contact_fax, :string 
  end

  def down
  	remove_column :clients, :last_name
  	remove_column :clients, :contact_fax
  end
end
