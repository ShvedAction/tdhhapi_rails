require 'test_helper'

class AreaTest < ActiveSupport::TestCase

  test "tree" do
    root_area = areas(:root_area)

    assert_equal 3, root_area.areas.size
    assert_equal 2, root_area.areas[0].areas.size
    assert_equal 2, root_area.areas[1].areas.size
  end

  test "import areas 1146"do
    area = Area.import 1146
    assert_equal 28, area.areas.size

    area = Area.find 1151
    assert_equal "Дивногорск", area.name
    assert_equal 1146, area.parent_id
  end
end
