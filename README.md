# Alerty::Plugin::Ikachan

ikachan plugin for alerty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alerty-plugin-ikachan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alerty-plugin-ikachan

## Configuration

* **type**: must be `ikachan`
* **host**: hostname
* **port**: port number
* **channel**: channel to notify
* **subject**: (optional) you can post one line of your favorite string. `${hostname}` and `${command}` placeholders are available

See [example.yml](./example.yml)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `gemspec`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sonots/alerty-plugin-ikachan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

