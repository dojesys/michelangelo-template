class Profile < ActiveRecord::Base
  attr_accessible :display_name, :about, :gender, :location, :website, :birthday, :locale
  
  belongs_to :user
  
  LOCALES = [[ I18n.t(:english) , 'en'], [ I18n.t(:spanish) , 'es']]

  validates_inclusion_of :locale, :in => %w(en es)

end
