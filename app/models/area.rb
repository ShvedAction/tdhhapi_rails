class Area < ActiveRecord::Base
  belongs_to :area, foreign_key: 'parent_id'
  has_many :areas, foreign_key: 'parent_id'

  accepts_nested_attributes_for :areas

  def initialize attributes = nil, options = {}
    if attributes
      children_area = attributes['areas'] if attributes['areas']
      attributes.delete 'areas'
    end

    super attributes, options

    if attributes && children_area
      children_area.each do |child_area|
        areas.new child_area
      end
    end
  end

  def import_all_vacansies page_limit: false
    first_page = HHAPIFacad.get_vacansy_by_area id
    first_page["items"].each  {|item| Vacansy.import item["id"]}
    count_pages = first_page["pages"]
    p count_pages
    if count_pages > 1
      up_limit_page = count_pages-1
      up_limit_page = page_limit if page_limit && up_limit_page > page_limit
      (1..up_limit_page).each do |count|
        page = HHAPIFacad.get_vacansy_by_area id, page: count
        page["items"].each  {|item| Vacansy.import item["id"]}
      end
    end
  end

  def self.import id
    Area.create HHAPIFacad.get_area(id)
  end
end
