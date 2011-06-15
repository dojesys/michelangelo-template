class Profile < ActiveRecord::Base
  attr_accessible :display_name, :about, :gender, :location, :website, :birthday
  
  belongs_to :user

#  validates_presence_of :gender
end
