class HHAPIFacad
  include HTTParty

  base_uri "https://api.hh.ru"

  def self.get_area id
    get_object id, :areas
  end

  def self.get_vacancy id
    get_object id, :vacancies
  end

  def self.get_vacancy_by_area area_id, page: false
    path = "/vacancies?area=#{area_id}"
    path = path + "&page=#{page}" if page
    p path
    get(path, verify: false).parsed_response
  end

  private
  def self.get_object id, type
    get("/#{type}/#{id}", verify: false).parsed_response
  end
end