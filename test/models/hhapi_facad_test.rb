require 'test_helper'

class HHAPIFacadTest < ActiveSupport::TestCase

  test "call hh api" do
    #Красноярский края
    area = HHAPIFacad.get_area(1146)

    #He include 28 children regions
    assert_equal 28, area['areas'].size, "Area with id 1146 should included 28 chindren regions"
  end
end