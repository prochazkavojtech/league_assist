# LeagueAssist

## Information
This gem is in early Alpha version


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'league_assist'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install league_assist

## Usage

Add your Riot API key to configuration

```ruby
LeagueAssist.configure do |config|
  config.api_key = ENV['KEY']
end
```

You can now load information about summoner with:
```ruby
LeagueAssist::Summoner.new(server: 'eun1', name: 'Adalbert')
```

Availible methods:

```ruby
  summoner = LeagueAssist::Summoner.new(server: 'eun1', name: 'Adalbert')

  # To retrieve match history, use
  matches = summoner.match_history.matches

  # This load array of Matches, you can now look at all information about the match
  matches[0].participants # returns Participant class with information about players
  duration[0].duration # 1400 - time in seconds
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Adalbeen-prog/league_assist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Adalbeen-prog/league_assist/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LeagueAssist project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Adalbeen-prog/league_assist/blob/master/CODE_OF_CONDUCT.md).
