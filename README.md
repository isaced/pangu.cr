# pangu

Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean) and half-width characters (alphabetical letters, numerical digits and symbols).

This is the Crystal copy version from [bugtender/rangu](https://github.com/bugtender/rangu).

- Official supports:
  - [pangu.go](https://github.com/vinta/pangu) (Go)
  - [pangu.java](https://github.com/vinta/pangu.java) (Java)
  - [pangu.js](https://github.com/vinta/pangu.js) (JavaScript)
  - [pangu.py](https://github.com/vinta/pangu.py) (Python)
  - [pangu.space](https://github.com/vinta/pangu.space) (Web API)

- Community supports:
  - [pangu.clj](https://github.com/coldnew/pangu.clj) (Clojure)
  - [pangu.dart](https://github.com/SemonCat/pangu.dart) (Dart)
  - [pangu.ex](https://github.com/cataska/pangu.ex) (Elixir)
  - [pangu.objective-c](https://github.com/Cee/pangu.objective-c) (Objective-C)
  - [pangu.php](https://github.com/Kunr/pangu.php) (PHP)
  - [pangu.rb](https://github.com/dlackty/pangu.rb) (Ruby)
  - [pangu.rs](https://github.com/airt/pangu.rs) (Rust)
  - [pangu.swift](https://github.com/X140Yu/pangu.Swift) (Swift)
  - [pangu.cr](https://github.com/isaced/pangu.cr) (Crystal)

## Installation

Add the dependency to your `shard.yml`:

```yaml
dependencies:
  pangu:
    github: isaced/pangu.cr
```

Run `shards install`

## Usage

```crystal
require "pangu"

Pangu.spacing("當你凝視著bug，bug也凝視著你")
=> "當你凝視著 bug，bug 也凝視著你"

Pangu.spacing("path/to/file.txt")
=> "與 PM 戰鬥的人，應當小心自己不要成為 PM"
```

## Contributing

1. Fork it (<https://github.com/isaced/pangu.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
