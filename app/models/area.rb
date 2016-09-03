class Area < ActiveRecord::Base
  belongs_to :area, foreign_key: "parent_id"
  has_many :areas, foreign_key: "parent_id"

  accepts_nested_attributes_for :areas

  def initialize attributes = nil, options = {}
    if attributes
      children_area = attributes["areas"] if attributes["areas"]
      attributes.delete "areas"
    end

    super attributes, options

    if attributes && children_area
      children_area.each do |child_area|
        areas.new child_area
      end
    end
  end

  def self.import id
    Area.create HHAPIFacad.get_area(id)
  end
end
