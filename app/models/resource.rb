class Resource
  include Mongoid::Document
  field :title, type: String
  field :host, type: String
  field :url, type: String
  field :domain, type: String

  def self.normalize_additional_fields(params)
    normalized_params = {}
    normalized_params[params[:column_name]] = params[:column_value]
    params.delete(:column_name)
    params.delete(:column_value)
    params.each do |name, value|
      unless name == params[:column_name]
        normalized_params[name] = value      
      end
    end
    normalized_params
  end

end
