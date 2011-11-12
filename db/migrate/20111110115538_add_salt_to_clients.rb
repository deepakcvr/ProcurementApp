class AddSaltToClients < ActiveRecord::Migration
  def change
    add_column :clients, :salt, :string
  end
end
