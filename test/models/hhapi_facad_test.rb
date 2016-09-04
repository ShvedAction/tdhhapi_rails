require 'test_helper'

class HHAPIFacadTest < ActiveSupport::TestCase

  test "call hh api" do
    #Красноярский края
    area = HHAPIFacad.get_area(1146)

    # He include 28 children regions
    assert_equal 28, area['areas'].size, "Area with id 1146 should included 28 chindren regions"
  end

  test "vacansy get" do
    vac = HHAPIFacad.get_vacancy(18107857)

    assert_equal "WIS Software", vac["employer"]["name"]
    assert_equal "Программист Ruby on Rails", vac["name"]
  end


  test "import vacansy scope" do
    page = HHAPIFacad.get_vacancy_by_area 1
    #p page["items"][0]
  end
end