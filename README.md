# HerokuLogParseo

Takes heroku log line as input and gives JSON output

## Installation

Add this line to your application's Gemfile:

    gem 'heroku_log_parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heroku_log_parser

## Usage

```ruby
require 'heroku_log_parser'

log_line = "2012-04-29T15:57:54+00:00 heroku[router]: GET www.foo.com/autocomplete/schools?q=Colegio+American dyno=web.4 queue=0 wait=0ms service=17ms status=200 bytes=496"

HerokuLogParser.parse(line)
#=> "{\"timestamp\":\"2012-04-29T15:57:50+00:00\",\"source\":\"heroku\",\"process\":\"web.4\",\"message\":\"Error R14 (Memory quota exceeded)\"}"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
