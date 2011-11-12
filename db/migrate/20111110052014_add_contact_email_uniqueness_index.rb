class AddContactEmailUniquenessIndex < ActiveRecord::Migration
  def up
  	add_index :clients, :contact_email, :unique => true
  end

  def down
  	remove_index :clients, :contact_email
  end
end
