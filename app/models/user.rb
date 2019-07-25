class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  validates_presence_of :name

  # Virtual method to call the split name of the User attribute
  def first_name
      self.name.split.first   
  end

  def last_name
      self.name.split.last
  end
end
