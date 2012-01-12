class Page  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :first_name, :last_name, :company_name, :problemdesc1, :contact_email
  attr_accessor :problemdesc
  attr_accessor :contact_phone, :contact_email
  
  #Validations goes here
  validates :first_name, :presence => true
  validates :company_name, :presence => true
  validates :problemdesc, :presence => true  
  validates :contact_email, :presence => true
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
end