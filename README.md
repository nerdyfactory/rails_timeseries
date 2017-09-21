# RailsTimeseries
RailsTimeseries is a gem that generates time series data and store in the database. You can select data by defining scope and the data collected will be used for statistics, drawing a chart

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_timeseries'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_timeseries

And to install templates:

    $ rails g rails_timeseries:install

And db migation:

    $ rails db:migrate


## Usage
### Define a scope
```ruby
class User < ApplicationRecord
  include RailsTimeseries
  timeseries_scope :active_users do
    where("current_sign_in_at > ?", 1.days.ago)
  end
end
```
and you can collect number of active_users in every day or every hours

### Set time frame
RailsTimeseries uses [whenever](https://github.com/javan/whenever) gem to run data collect job. you can change time frame by modifying `config/schedule.rb` file that is generated during installation.
```ruby
# it collects data in every 5AM
every :day, at: '5:00am' do
  runner "Timeseries.generate"
end
```

### Retrive datas
``` ruby
Timeseries.data(:active_users)
#this will return number of active_users with date
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_timeseries. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsTimeseries project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_timeseries/blob/master/CODE_OF_CONDUCT.md).
