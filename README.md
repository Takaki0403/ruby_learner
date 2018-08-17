# RubyLearner

Ruby mastering application.
It checks your code using rspec and rubocop.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_learner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_learner

## Usage
```ruby
Usage: ruby_learner [options]
Options: emacs_key					- confirm emacs key-bindings.
       	 sequential_check [section:1~1] [part:1~2]	- learning drill.
	 		  -drill			- confirm drill numbers
			  -next				- learning next to final history
```

In learning in this app, you can choice 3 mode.  
Mode 1: you can continue to answer the question:

     $ [RET]

Mode 2: you can confirm answer example.

     $ answer + [RET]

Mode 3: you can stop answer the question.

     $ exit + [RET]

## Workshop

This app makes a directory in your Home-Directory, 'ruby_learner'. If you confirm your learning history, you should check ruby_learner/workshop/restore.

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_learner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
