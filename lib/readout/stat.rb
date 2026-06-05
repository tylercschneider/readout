# frozen_string_literal: true

module Readout
  class Stat
    attr_reader :key, :title, :definition

    def initialize(key:, title: nil, definition: nil, source: nil)
      @key = key
      @title = title
      @definition = definition
      @source = source
    end

    def read(inputs)
      @source.call(inputs)
    end
  end
end
