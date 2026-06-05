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

The core contract works — a `Stat` reads through its `Source` and returns a
normalized `Result`:

```ruby
source = ->(inputs) { Readout::Result.new(value: 0.42, shape: :scalar, exact: true) }
stat   = Readout::Stat.new(
  key: :sales_conversion,
  title: "Sales Conversion",
  definition: "Share of qualified leads that became deals.",
  calculation: "deals ÷ qualified leads, within the period",
  unit: :percent,
  timeframe: "This month",
  source: source
)

stat.read(qualified: 100, won: 42).value   # => 0.42
stat.definition                            # the plain-English "what it captures"
stat.calculation                           # the "how it's computed"
```

A Stat is **self-describing** — `title`, `definition`, `calculation`, `unit`,
`timeframe` — so a UI can explain any number without hardcoding meaning. `Result`
carries `value, shape, as_of, exact`. Swap the `Source` (a tally-backed one, a live
query, a fixture) without touching the Stat or the display.

Next: declared inputs (required/optional) + validation.

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
