class Skill < ApplicationRecord
  include Placeholder

    validates_presence_of :title, :percent_utilized
    #Initialize badge image for skills
    
    #Call back at model level
    after_initialize :set_defaults

    def set_defaults
      self.badge ||= Placeholder.image_generator(height: 250, width: 250)
    end
end
