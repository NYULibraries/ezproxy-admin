class Resource
  include Mongoid::Document

  def self.normalize_additional_fields(params)
    normalized_params = {}

    params[:dynamic_field].each do |dynamic_field|
      next if dynamic_field[:name].empty?
      normalized_params[dynamic_field[:name]] = dynamic_field[:value]
    end
    params.delete(:dynamic_field)

    params.each do |name, value|
      if normalized_params.keys.include? name
        normalized_params[name] = [normalized_params[name], name]
      else
        normalized_params[name] = value      
      end
    end

    normalized_params
  end

end
