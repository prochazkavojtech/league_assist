# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'
require_relative "league_assist/version"
require_relative 'league_assist/configuration'
require_relative 'league_assist/request'
require_relative 'league_assist/error'
require_relative 'league_assist/summoner'

module LeagueAssist
  extend Configuration
end
