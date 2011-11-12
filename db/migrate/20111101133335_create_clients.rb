class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :login_name
      t.string :login_password
      t.string :contact_name
      t.string :company_name
      t.string :contact_email
      t.string :contact_phone
      t.string :company_website
      t.string :company_address1
      t.string :company_address2
      t.string :company_city
      t.string :company_state
      t.integer :company_pincode
      t.string :company_country

      t.timestamps
    end
  end
end
