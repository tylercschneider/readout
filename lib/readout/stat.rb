# frozen_string_literal: true

module Readout
  class Stat
    attr_reader :key, :title

    def initialize(key:, title: nil, source: nil)
      @key = key
      @title = title
      @source = source
    end

    def read(inputs)
      @source.call(inputs)
    end
  end
end
