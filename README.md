# Readout

A **source-agnostic, self-describing metric contract**.

A `Readout::Stat` describes a metric — its key, title, plain-English definition,
unit, timeframe, and declared inputs — and exposes a normalized **result shape**
(`value`, `shape`, `as_of`, `exact`). Behind every Stat is a **Source** (an adapter
port); the Stat doesn't care where its number comes from.

That decoupling is the whole point: a display layer (e.g. `dash_kit`) renders Stats
without knowing whether the number came from `tally` rollups, a live query, or a
fixture. Swap the Source, keep the Stat.

Readout depends on nothing concrete — no Rails, no event source, no aggregation
engine. Adapters bridge it to whatever produces the numbers.

## Installation

```ruby
gem "readout"
```

## Status

Early development — building the Stat contract and the Source port.

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
