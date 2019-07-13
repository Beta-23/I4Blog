class Blog < ApplicationRecord
  # Data Query scope and method for blog post status
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
  
end
