# Brutal 💎🔨

[![Version](https://img.shields.io/github/v/tag/fixrb/brutal?label=Version&logo=github)](https://github.com/fixrb/brutal/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/brutal/main)
[![Ruby](https://github.com/fixrb/brutal/workflows/Ruby/badge.svg?branch=main)](https://github.com/fixrb/brutal/actions?query=workflow%3Aruby+branch%3Amain)
[![RuboCop](https://github.com/fixrb/brutal/workflows/RuboCop/badge.svg?branch=main)](https://github.com/fixrb/brutal/actions?query=workflow%3Arubocop+branch%3Amain)
[![License](https://img.shields.io/github/license/fixrb/brutal?label=License&logo=github)](https://github.com/fixrb/brutal/raw/main/LICENSE.md)

> A _code-first_ approach to automate the writing of unit tests.

## Intro

[![I Hate Tests](https://github.com/fixrb/brutal/raw/main/img/rubyhack-2019-ruby3-what-s-missing-by-yukihiro-matsumoto.jpg)](https://www.youtube.com/embed/cmOt9HhszCI?start=1732&end=1736 "I don't like tests. It's not DRY.")

> I don't like tests. It's not DRY.
> -- [Matz](https://github.com/matz)

## Overview

Let __Brutal__ craft for you in no time a (potentially huge) framework-less vanilla Ruby file describing the actual behavior of your code across as many context combinations as necessary.

By delegating to __Brutal__ the repetitive (and redundant) task of writing tests, you will be able to focus on your core business: the code itself.

![Brutal-Driven Development](https://github.com/fixrb/brutal/raw/main/img/brutal-driven-development.jpg)

## Warning

The _Brutal-Driven Development_ process does not prevent bugs from appearing in the code.

A generated test suite acts as a _picture of the code's behavior_. Therefore, if the code is wrong, the picture of the code's behavior will also be wrong.

The mere fact that all expectations are true does not mean that the code behaves as it should.

It is therefore the responsibility of the developer to analyze the generated behavioral pictures to ensure that the code reacts as it is supposed to according to the contexts in which it is evaluated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "brutal"
```

And then execute:

```sh
bundle install
```

Or install it yourself as:

```sh
gem install brutal
```

## Quick Start

Just type `brutal` in a Ruby project's folder and watch the magic happen.

## Usage

The `brutal.yml` file is a manifest you can use to define your __Brutal__ meta-spec.
It has 4 top-level sections:

* `header` - Specifies the code to execute before generating the test suite.
* `subject` - Specifies the template of the code to be declined across contexts.
* `contexts` - Specifies a list of variables to populate the subject's template.
* `actuals` - Specifies templates to challenge evaluated subjects & get results.

### Getting started

1. Create a `brutal.yml` file in your application's root directory.
The following example `brutal.yml` defines the shape of a Hello test suite:

```yaml
---
subject: |
  "Hello " + "%{string}"

contexts:
  string:
    - Alice
    - Bob

actuals:
  - "%{subject}.to_s"
  - "%{subject}.length"
```

2. Run the `brutal` command from the same directory.

3. Read the generated `test.rb` file in the same directory:

```ruby
# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Alice"
end

raise if actual.to_s != "Hello Alice"
raise if actual.length != 11

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Bob"
end

raise if actual.to_s != "Hello Bob"
raise if actual.length != 9
```

### More examples

https://github.com/fixrb/brutal/raw/main/examples/

## Rake integration example

A generated `test.rb` file could be matched as follows:

```ruby
Rake::TestTask.new do |t|
  t.pattern = "test.rb"
end
```

## Test suite

__Brutal__'s test set is brutally self-generated here: [./test.rb](https://github.com/fixrb/brutal/blob/main/test.rb)

## Contact

* Source code: https://github.com/fixrb/brutal

## Versioning

__Brutal__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/brutal) is available as open source under the terms of the [MIT License](https://github.com/fixrb/brutal/raw/main/LICENSE.md).

***

This project is sponsored by:

![Sashité logo](img/sponsor/dark/en/sashite.png#gh-dark-mode-only "Sashité")
![Sashité logo](img/sponsor/light/en/sashite.png#gh-light-mode-only "Sashité")
