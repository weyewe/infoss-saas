class Contact < ActiveRecord::Base
  validates_presence_of :name 
  belongs_to :contact_group
  validate :valid_status
  validate :valid_shipment_status
  validate :valid_city_location
  validate :valid_contact_as

  def valid_status
    return if status.nil?
    if not [1,2,3].include?( status.to_i ) 
      self.errors.add(:status, "Contact Status harus ada")
      return self 
    end
  end
  
  def valid_shipment_status
    return if shipment_status.nil?
    if not [1,2,3].include?( shipment_status.to_i ) 
      self.errors.add(:status, "Shipment Status harus ada")
      return self 
    end
  end
  
  
  def valid_city_location
    return if city_location_id.nil?
    city = CityLocation.find_by_id city_location_id
    if city.nil? 
      self.errors.add(:city_location_id, "Harus ada city")
      return self 
    end
  end 
  
  def valid_contact_as
    if self.is_agent == false && self.is_consignee == false && self.is_depo == false &&
      self.is_emkl == false && self.is_iata == false && self.is_shipper == false && 
      self.is_ssline == false
      self.errors.add(:generic_errors,"Pilih Salah Satu Contact As")
      return self
    end
  end
  
  def self.active_objects
    self
  end
  
  def self.create_object(params)
    new_object = self.new
    new_object.name = params[:name].upcase
    new_object.status = params[:status]
    new_object.company_id = params[:company_id]
    new_object.address = params[:address].upcase
    new_object.postal_code = params[:postal_code]
    new_object.contact_person = params[:contact_person].upcase
    new_object.phone = params[:phone]
    new_object.email = params[:email]
    new_object.fax = params[:fax]
    new_object.npwp = params[:npwp]
    new_object.nppkp = params[:nppkp]
    new_object.credit_terms_in_days = params[:credit_terms_in_days]
    new_object.credit_terms_in_idr = params[:credit_terms_in_idr]
    new_object.city_location_id = params[:city_location_id]
    new_object.airport_id = params[:airport_id]
    new_object.port_id = params[:port_id]
    new_object.shipment_status = params[:shipment_status]
    new_object.is_agent = params[:is_agent]
    new_object.is_shipper = params[:is_shipper] 
    new_object.is_consignee = params[:is_consignee]
    new_object.is_emkl = params[:is_emkl]
    new_object.is_depo = params[:is_depo]
    new_object.is_iata = params[:is_iata]
    new_object.is_ssline = params[:is_ssline]
    if new_object.save
      new_object.code = generate_contact_code
      new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.name = params[:name].upcase
    self.status = params[:status]
    self.company_id = params[:company_id]
    self.address = params[:address].upcase
    self.postal_code = params[:postal_code]
    self.contact_person = params[:contact_person].upcase
    self.phone = params[:phone]
    self.email = params[:email]
    self.fax = params[:fax]
    self.npwp = params[:npwp]
    self.nppkp = params[:nppkp]
    self.credit_terms_in_days = params[:credit_terms_in_days]
    self.credit_terms_in_idr = params[:credit_terms_in_idr]
    self.city_location_id = params[:city_location_id]
    self.airport_id = params[:airport_id]
    self.port_id = params[:port_id]
    self.shipment_status = params[:shipment_status]
    self.is_agent = params[:is_agent]
    self.is_shipper = params[:is_shipper] 
    self.is_consignee = params[:is_consignee]
    self.is_emkl = params[:is_emkl]
    self.is_depo = params[:is_depo]
    self.is_iata = params[:is_iata]
    self.is_ssline = params[:is_ssline]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
  end
  
  def generate_contact_code
    company_id = self.company_id
    contact = Contact.where {
      company_id.eq company_id
    }
    if contact.count == 0 
      return 1
    else
      return contact.max(:code) + 1
    end
  end
  
end
