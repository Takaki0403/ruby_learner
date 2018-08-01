# RubyLearner

Ruby mastering application

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_learner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_learner

Now it is not release. If you want to use it, you must under guides:

    $ git clone git@github.com:Takaki0403/ruby_learner.git

In this clone directory:
   $ rake build
   $ rake install:local

## Usage
```ruby
Usage: ruby_learner [options]
       sequential_check:	learning drill.
```

In learning in this app, you can choice 3 mode.\n
Mode 1: you can continue to answer the question:

     $ [RET]


Mode 2: you can confirm answer example.

     $ answer + [RET]

Mode 3: you can stop answer the question.

     $ exit + [RET]

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_learner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
