# frozen_string_literal: true

module Readout
  class Stat
    attr_reader :key, :title, :definition, :calculation, :unit

    def initialize(key:, title: nil, definition: nil, calculation: nil, unit: nil, source: nil)
      @key = key
      @title = title
      @definition = definition
      @calculation = calculation
      @unit = unit
      @source = source
    end

    def read(inputs)
      @source.call(inputs)
    end
  end
end
