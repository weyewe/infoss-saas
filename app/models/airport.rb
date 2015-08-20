class Airport < ActiveRecord::Base
  validates_presence_of :name 
  validate :valid_city
  belongs_to :city_location
  
  def self.active_objects
    self
  end
  
  def valid_city
    return if city_location_id.nil?
    city = CityLocation.find_by_id city_location_id
    if city.nil? 
      self.errors.add(:city_location_id, "Harus ada city")
      return self 
    end
  end 
  
  
  def self.create_object(params)
    params[:name] = params[:name].upcase if params[:name].present?
    params[:abbrevation] = params[:abbrevation].upcase if params[:abbrevation].present?
    new_object = self.new
    new_object.name = params[:name]
    new_object.abbrevation = params[:abbrevation]
    new_object.city_location_id = params[:city_location_id]
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
    self.city_location_id = params[:city_location_id]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
end
