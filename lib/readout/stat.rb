# frozen_string_literal: true

module Readout
  class Stat
    attr_reader :key, :title

    def initialize(key:, title: nil)
      @key = key
      @title = title
    end
  end
end
