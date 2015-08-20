class Cost < ActiveRecord::Base
    validates_presence_of :name 
      
    def self.active_objects
        self
    end
    
    def self.create_object(params)
        new_object = self.new
        new_object.code = params[:code]
        new_object.name = params[:name]
        new_object.amount = BigDecimal(params[:amount] || '0')
        new_object.cbm = BigDecimal(params[:cbm] || '0')
        new_object.min_charge_idr = BigDecimal(params[:min_charge_idr] || '0')
        new_object.min_charge_usd = BigDecimal(params[:min_charge_usd] || '0')
        new_object.max_charge_usd = BigDecimal(params[:max_charge_usd] || '0')
        new_object.cost_type = params[:cost_type]
        new_object.description = params[:description]
        if new_object.save
        end
        return new_object
    end
    
    def update_object(params)
        self.code = params[:code]
        self.name = params[:name]
        self.amount = BigDecimal(params[:amount] || '0')
        self.cbm = BigDecimal(params[:cbm] || '0')
        self.min_charge_idr = BigDecimal(params[:min_charge_idr] || '0')
        self.min_charge_usd = BigDecimal(params[:min_charge_usd] || '0')
        self.max_charge_usd = BigDecimal(params[:max_charge_usd] || '0')
        self.cost_type = params[:cost_type]
        self.description = params[:description]
        if self.save
        end
        return self
    end
    
    def delete_object
        self.destroy
        return self
    end
    
end
