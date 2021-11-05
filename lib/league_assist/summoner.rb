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
      @match_history = get_match_history
    end

    def get_match_history
      MatchHistory.new(self)
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