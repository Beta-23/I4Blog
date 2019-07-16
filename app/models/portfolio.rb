class Portfolio < ApplicationRecord
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

    #Method to ensure images are not nil after the @portfolio create call back at portfolio_controller action
    def set_defaults
      self.main_image ||= "https://via.placeholder.com/600x400"
      self.thumb_image ||= "https://via.placeholder.com/350x200" 
    end
end
