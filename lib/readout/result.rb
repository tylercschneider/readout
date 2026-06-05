# frozen_string_literal: true

module Readout
  Result = Struct.new(:value, :shape, :as_of, :exact, keyword_init: true)
end
