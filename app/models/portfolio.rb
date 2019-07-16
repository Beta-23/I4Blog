class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # Custom scope for angular database query
    def self.angular
      where(subtitle: 'Angular')
    end
    # Creating a lambda using shorthand notation
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end
