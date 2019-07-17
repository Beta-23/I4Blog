class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder
  #Validations
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scope for angular database query
  def self.angular
    where(subtitle: 'Angular')
  end
  # Creating a lambda using shorthand notation
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  #Call back at model level
  after_initialize :set_defaults

    #Method to ensure images are not nil after the @portfolio create call back at portfolio_controller action, it also calls the placeholder module (concerns)
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
