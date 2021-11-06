module LeagueAssist
  class MatchHistory < Request
    VERSION = 'v5'.freeze

    attr_reader :matches, :created_at

    def initialize(account, start, count)
      match_ids = get_match_ids(account, start, count)
      @matches = []
      @created_at = Time.now
      
      match_ids.each do |id|
        @matches << Match.new(get_match(account, id))
      end
    end
    
    def get_match(account, id)
      request(account.region, "/lol/match/v5/matches/#{id}")
    end

    def get_match_ids(account, start, count)
      request(account.region, "/lol/match/#{VERSION}/matches/by-puuid/#{account.puuid}/ids", { start: start, count: count })
    end
  end
end