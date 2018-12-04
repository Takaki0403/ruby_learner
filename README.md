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
Options:
	 -v						- check ruby_learner's version.
	 
	 emacs_key (-e)					- confirm emacs key-bindings.
	 emacs_key -image (-i)				- confirm emacs key-bindings in the image.
	 
	 sequential_check (-s) [sec:1~11] [par:1~3]	- learning drill.
	 sequential_check -drill (-d)	 		- confirm drill numbers and contents.
	 sequential_check -next (-n)			- learn next to final history.
	 sequential_check -last (-l)			- learn final history.
	 sequential_check -workshop (-w)		- move current_directory to workshop.
	 sequential_check -manual (-m)			- change mode manual or nomal.
	 sequential_check -copspec (-c)			- check your answer.

	 restore (-r)	  				- check your restore.
	 restore [number]				- open your number's restore.
	 restore -refresh (-r)				- clear all your restore.

	 copspec (-c) [file_path]			- check your original code in ruby_learner.
	 pair_popup (-p) [time]				- popup a alert per times, for pair_programing.
	 install_emacs (-i)				- install emacs in your mac.
	 theme (-t) [black or white]			- change ruby_learner's theme.
```

Main content of this app is sequential_check.

## Sequential_check: nomal
First, you execute '$ ruby_learner -s 1 1'.
In learning in this app, you can choice 3 mode.  
Mode 1: you can continue to answer the question:

     $ [RET]

Mode 2: you can confirm answer example.

     $ answer + [RET]

Mode 3: you can stop answer the question.

     $ exit + [RET]

Try the question!
When you want to learn next question, execute '$ ruby_learner -s -n'

## Sequential_check: manual
** this mode need emacs. Please install emacs.
For this mode is active, execute '$ ruby_learner -s -m'.
If your current directory is not workshop, execute '$ ruby_learner -s -w'
First, you execute '$ ruby_learner -s 1 1'.

In workshop/lib,
workplace.rb: you answer in the file.
sentence.org: question and text.
answer.rb: answer.

When you want to open 2 files, execute '$ emacs sentence.org workplace.rb'

ruby_learner's check(rspec and rubocop): '$ ruby_learner -s -c'
rspec: '$ rspec spec'
rubocop: '$ rubocop lib/workplace.rb'

## Workshop

This app makes a directory in your Home-Directory, 'ruby_learner'. If you confirm your learning history, you should check ruby_learner/workshop/restore.

## If it cannot be executed due to an error

I think the cause is your workshop-directory. Please execute this command in your Home-Directory.

     $ rm -rf ruby_learner


## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Takaki0403/ruby_learner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
