module LeagueAssist
  module Configuration
    attr_accessor :api_key

    def configure
      yield self
    end
  end
end