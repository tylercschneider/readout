# frozen_string_literal: true

require "test_helper"

module Readout
  class StatTest < Minitest::Test
    def test_exposes_its_key
      stat = Stat.new(key: :sales_conversion)

      assert_equal :sales_conversion, stat.key
    end

    def test_exposes_its_title
      stat = Stat.new(key: :sales_conversion, title: "Sales Conversion")

      assert_equal "Sales Conversion", stat.title
    end
  end
end
