class Vacancy < ActiveRecord::Base
  belongs_to :area

  def self.import id
    Vacancy.create HHAPIFacad.get_vacancy(id) unless Vacancy.exists? id: id
  end

  def self.byAreaId id
    # получение всех id из дерево локации
    area = Area.find id
    ids = area.kind_of?(Array) ? area.map{|a| a.get_child_ids}.flatten : area.get_child_ids
    includes(:area).where area_id: ids
  end

  @@permit_build_key = ["description", "alternate_url", "name", "id", "archived", "area_id", "published_at", "type_name"]

  def initialize attributes = nil, options = {}
    #корректировка приходящих атрибутов
    if attributes
      attributes["area_id"] = attributes["area"]["id"]
      attributes["type_name"] = attributes["type"]["name"]
      attributes.keys.each {|key| attributes.delete key unless @@permit_build_key.include? key}
    end

    super attributes, options
  end
end
