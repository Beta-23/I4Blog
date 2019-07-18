module Placeholder
  #Module helper
  extend ActiveSupport::Concern
  #Method to be shared among app models
  def self.image_generator(height:, width:)
    "https://via.placeholder.com/#{height}x#{width}"  
   end 
end