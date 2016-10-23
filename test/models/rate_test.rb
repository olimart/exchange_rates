require 'test_helper'

class RateTest < ActiveSupport::TestCase
  test 'has valid test data' do
    Rate.find_each do |rate|
      assert_valid rate
    end
  end

  should validate_presence_of(:from_iso_code)
  should validate_presence_of(:to_iso_code)
  should validate_presence_of(:date)
  should validate_presence_of(:rate)
  should validate_uniqueness_of(:from_iso_code).scoped_to(:to_iso_code)
  should validate_inclusion_of(:from_iso_code).in_array(Rate::SUPPORTED_CURRENCIES)

end
