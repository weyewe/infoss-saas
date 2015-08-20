class CountryLocation < ActiveRecord::Base
  validates_presence_of :name ,:continent_id
  validate :valid_continent
  belongs_to :continent
  
  def self.active_objects
    self
  end
  
  def valid_continent
    return if continent_id.nil?
    continent = Continent.find_by_id continent_id
    if continent.nil? 
      self.errors.add(:continent_id, "Harus ada continent")
      return self 
    end
  end 
  
  
  def self.create_object(params)
    params[:name] = params[:name].upcase if params[:name].present?
    params[:abbrevation] = params[:abbrevation].upcase if params[:abbrevation].present?
    new_object = self.new
    new_object.name = params[:name]
    new_object.abbrevation = params[:abbrevation]
    new_object.continent_id = params[:continent_id]
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
    self.continent_id = params[:continent_id]
    if self.save
    end
    return self
  end
  
  def delete_object
   self.destroy
   return self
  end
    
    
end
