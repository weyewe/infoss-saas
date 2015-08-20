class Vat < ActiveRecord::Base
    validates_presence_of :name 
      
    def self.active_objects
        self
    end
    
    def self.create_object(params)
        new_object = self.new
        new_object.name = params[:name]
        new_object.value = BigDecimal(params[:value] || '0')
        if new_object.save
        end
        return new_object
    end
    
    def update_object(params)
        self.name = params[:name]
        self.value = BigDecimal(params[:value] || '0')
        if self.save
        end
        return self
    end
    
    def delete_object
        self.destroy
        return self
    end
    
    
end
