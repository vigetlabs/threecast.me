class Location < ActiveRecord::Base
  validates :name, :slug, :lat, :lng, presence: true
end