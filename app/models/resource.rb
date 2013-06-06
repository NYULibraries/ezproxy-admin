class Resource
  include Mongoid::Document
  field :title, type: String
  field :host, type: String
  field :url, type: String
  field :domain, type: String

  def self.normalize_additional_fields(params)
    normalized_params = {}
    params[:dynamic_field].each do |dynamic_field|
      next if dynamic_field[:name].empty?
      normalized_params[dynamic_field[:name]] = dynamic_field[:value]
    end
    params.delete(:dynamic_field)
    params.each do |name, value|
      unless name == params[:column_name]
        normalized_params[name] = value      
      end
    end
    normalized_params
  end

end
