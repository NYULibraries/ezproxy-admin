class Resource
  include Mongoid::Document
  field :title, type: String
  field :host, type: String
  field :url, type: String
  field :domain, type: String
end
