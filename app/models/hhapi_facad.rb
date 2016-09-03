class HHAPIFacad
  include HTTParty

  base_uri "https://api.hh.ru"

  def self.get_area id
    get("/areas/#{id}", verify: false).parsed_response
  end

end