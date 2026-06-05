# frozen_string_literal: true

require "test_helper"

module Readout
  class StatTest < Minitest::Test
    def test_exposes_its_key
      stat = Stat.new(key: :sales_conversion)

      assert_equal :sales_conversion, stat.key
    end
  end
end
