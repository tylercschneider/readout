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

    def test_exposes_its_definition
      stat = Stat.new(key: :sales_conversion, definition: "Share of leads that became deals.")

      assert_equal "Share of leads that became deals.", stat.definition
    end

    def test_reads_its_value_through_its_source
      source = ->(_inputs) { Result.new(value: 0.42, shape: :scalar, exact: true) }
      stat = Stat.new(key: :sales_conversion, source: source)

      assert_in_delta 0.42, stat.read({}).value
    end
  end
end
