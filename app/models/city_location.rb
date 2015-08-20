class CityLocation < ActiveRecord::Base
  validates_presence_of :name , :country_location_id
  validate :valid_country
  belongs_to :country_location
  
  def self.active_objects
    self
  end
  
  def valid_country
    return if country_location_id.nil?
    country = CountryLocation.find_by_id country_location_id
    if country.nil? 
      self.errors.add(:country_location_id, "Harus ada country")
      return self 
    end
  end 
  
  
  def self.create_object(params)
    params[:name] = params[:name].upcase if params[:name].present?
    params[:abbrevation] = params[:abbrevation].upcase if params[:abbrevation].present?
    new_object = self.new
    new_object.name = params[:name]
    new_object.abbrevation = params[:abbrevation]
    new_object.country_location_id = params[:country_location_id]
    if new_object.save
      new_object.code = new_object.id
      new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    params[:name] = params[:name].upcase if params[:name].present?
    params[:abbrevation] = params[:abbrevation].upcase if params[:abbrevation].present?
    self.name = params[:name]
    self.abbrevation = params[:abbrevation]
    self.country_location_id = params[:country_location_id]
    if self.save
    end
    return self
  end
  
  def delete_object
   self.destroy
   return self
  end
    
    
end
