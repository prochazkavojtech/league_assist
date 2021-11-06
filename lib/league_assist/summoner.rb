module LeagueAssist
  class Summoner < Request
    VERSION = 'v4'
    attr_reader :name, :id, :puuid, :region, :server, :match_history

    def initialize(name: nil, server: nil)
      account = request(server, "/lol/summoner/#{VERSION}/summoners/by-name/#{name}")
      @id = account['id']
      @puuid = account['puuid']
      @name = account['name']
      @server = server
      @region = get_region(server)
    end

    def match_history(start: 0, count: 1, refresh: false)
      @match_history = get_match_history(start, count) if refresh || @match_history.nil?
      @match_history
    end

    def get_match_history(start, count)
      MatchHistory.new(self, start, count)
    end

    private

    def get_region(server)
      case server
      when 'br1', 'la1', 'la2', 'na1', 'oc1'
        'americas'
      when 'jp1', 'kr'
        'asia'
      when 'eun1', 'euw1', 'tr1', 'ru'
        'europe'
      end
    end
  end
end