# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'
require_relative "league_assist/version"
require_relative 'league_assist/configuration'
require_relative 'league_assist/request'
require_relative 'league_assist/error'
require_relative 'league_assist/summoner'
require_relative 'league_assist/match_history'
require_relative 'league_assist/match'
require_relative 'league_assist/participant'

module LeagueAssist
  extend Configuration
end
