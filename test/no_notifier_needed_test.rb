require 'test_helper'

class NoNotifierNeededTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, NoNotifierNeeded
  end
end
