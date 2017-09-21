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


  def test_standard_deviation_returns_nil_for_empty_array
    assert_nil Stats.standard_deviation([])
  end

  def test_standard_deviation_returns_nil_for_array_with_only_elements
    assert_nil Stats.standard_deviation([nil, nil])
  end

  def test_standard_deviation_returns_standard_deviation_of_numbers
    assert_equal Math.sqrt(2.5), Stats.standard_deviation([1, 2, 3, 4, 5])
  end

  def test_standard_deviation_can_transform_its_elements
    assert_equal Math.sqrt(2.5), Stats.standard_deviation([0, 1, 2, 3, 4], &:next)
  end


  def test_standard_deviations_from_mean_returns_subset_of_elements
    assert_equal [5], Stats.standard_deviations_from_mean(1, [1, 2, 3, 4, 5])
  end

  def test_standard_deviations_from_mean_works_below_mean
    assert_equal [1], Stats.standard_deviations_from_mean(-1, [1, 2, 3, 4, 5])
  end

  def test_standard_deviations_from_mean_can_transform_its_elements
    assert_equal [4], Stats.standard_deviations_from_mean(1, [0, 1, 2, 3, 4], &:next)
  end


end
