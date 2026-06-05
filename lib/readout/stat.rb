# frozen_string_literal: true

module Readout
  class Stat
    attr_reader :key

    def initialize(key:)
      @key = key
    end
  end
end
