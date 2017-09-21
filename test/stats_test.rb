require './test/test_helper'
require './lib/stats'


class StatsTest < Minitest::Test

  def test_mean_returns_nil_for_empty_array
    assert_nil Stats.mean([])
  end

  def test_mean_returns_nil_for_array_with_only_elements
    assert_nil Stats.mean([nil, nil])
  end

  def test_mean_returns_mean_of_numbers
    assert_equal 3, Stats.mean([1, 2, 3, 4, 5])
  end

  def test_mean_can_transform_its_elements
    assert_equal 4, Stats.mean([1, 2, 3, 4, 5], &:next)
  end

end
