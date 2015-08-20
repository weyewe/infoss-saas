class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :code  
      t.string :name  
      t.integer :company_id  
      t.integer :status ,:default => 1
      t.text   :address
      t.string :contact_person
      t.string :postal_code
      t.string :phone
      t.string :fax
      t.string :email
      t.string :npwp
      t.string :nppkp
      t.integer :city_location_id
      t.integer :port_id
      t.integer :airport_id
      t.integer :credit_terms_in_days
      t.integer :credit_terms_in_idr
      t.string :shipment_status ,:default => 1
      t.integer :last_shipment_date
      t.boolean :is_agent , :default => false
      t.string :agent_code 
      t.boolean :is_shipper , :default => false
      t.string :shipper_code 
      t.boolean :is_consignee , :default => false
      t.string :consignee_code 
      t.boolean :is_iata , :default => false
      t.string :iata_code 
      t.boolean :is_ssline , :default => false
      t.string :ssline_code 
      t.boolean :is_depo , :default => false
      t.string :depo_code 
      t.boolean :is_emkl , :default => false
      t.string :emkl_code , :default => false
      t.string :master_code , :default => false
      t.timestamps
    end
  end
end
