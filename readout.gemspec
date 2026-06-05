# frozen_string_literal: true

require_relative "lib/readout/version"

Gem::Specification.new do |spec|
  spec.name = "readout"
  spec.version = Readout::VERSION
  spec.authors = ["tylercschneider"]
  spec.email = ["tylercschneider@gmail.com"]

  spec.summary = "Source-agnostic, self-describing metric contract"
  spec.description = "Readout defines a Stat — a self-describing metric (key, title, plain-English definition, unit, timeframe, declared inputs) with a normalized result shape (value, shape, as_of, exact) and a Source adapter port. It depends on nothing concrete: any source (e.g. tally rollups) plugs in behind a Stat, so the display layer never couples to where a number comes from."
  spec.homepage = "https://github.com/tylercschneider/readout"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .rubocop.yml])
    end
  end
  spec.require_paths = ["lib"]
end
