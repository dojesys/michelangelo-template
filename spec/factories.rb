require 'factory_girl'

Factory.define :user do |u|
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :profile do |p|
  p.display_name 'User Name'
  p.about "I'm a cool User"
  p.gender 'Male'
  p.location 'Right Here'
  p.website 'http://cool.i.am'
  p.birthday 30.years.ago
  p.locale 'en'
end

Factory.define :authentication do |a|
  a.provider 'facebook'
  a.uid '12345'
end