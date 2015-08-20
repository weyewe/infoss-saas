class Job < ActiveRecord::Base
validates_presence_of :name 
      
    def self.active_objects
        self
    end
    
    
    def self.create_object(params)
        new_object = self.new
        new_object.name = params[:name]
        new_object.code = params[:code]
        if new_object.save
        end
        return new_object
    end
    
    def update_object(params)
        self.name = params[:name]
        self.code = params[:code]
        if self.save
        end
        return self
    end
    
    def delete_object
        self.destroy
        return self
    end
end
