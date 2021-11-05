module LeagueAssist
  class MatchHistory < Request
    VERSION = 'v5'.freeze

    attr_reader :matches

    def initialize(account)
      match_ids = get_match_ids(account)
      @matches = []
      
      match_ids.each do |id|
        @matches << Match.new(get_match(account, id))
      end
    end
    
    def get_match(account, id)
      request(account.region, "/lol/match/v5/matches/#{id}")
    end

    def get_match_ids(account, count = 10)
      request(account.region, "/lol/match/#{VERSION}/matches/by-puuid/#{account.puuid}/ids", { count: count })
    end
  end
end